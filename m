Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC5D53E49E7
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784883429; cv=none; b=NGoXvgu2zKckjVCKHRPbOOk4MG8kdnh10oGANUglxCqSA9UHjdDWhF4nZetbHyJBzIXqc5asW7KmMwPoVd1oFHz+qPQywUaA5XtdPBpeQCi/vGw28OmFcwJ/4Zj5Q5s1esAMI3n7hW6A54p72yGYqibhnWkKo4ZwArtdto3UTac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784883429; c=relaxed/simple;
	bh=ehehTOb971vNnqcNyXX/0RP3JdqsfY8qihmSio3Rxnc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nd0+rzIG6rB1S73AEDa5Q5ZYYggPzRGhSmSs0O8OsaCb6g9iuUSkZlBSHxqHW26Jkx4A/QkD9FJYIQHOj2G+WygZUTUn8BppV8FmQjFUhcTcQom3LneBK1WKdwQqHB+mZOUwymd/vyyF+Y3H9uHDvo3Yep4+bYfOJ2flInSo5/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AU/3rh5M; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PBEgpZJD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AU/3rh5M";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PBEgpZJD"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66O4lCEN2275931
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:57:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=uY9uni8DTsA+d0nJwe4VSgTG9ecNhKhf3SZ
	5YEfrVf8=; b=AU/3rh5MIlTkbR4RMxO7rHPnflCK/iTZXjU2Ysf0Gs1pYnivCxM
	h56IlvmzNfhOoW3a7DPnsconuHvFjfieROSfubRXF8bFJ9IKMOoxZAz4H8oQWYbd
	D+pVh3ZYEA56q/I2jxoA0jGXUzRgmd/jA61p3u3A38JupT2Rf9gTWuhQSOtUobqy
	iB+x/1EC3hQtteBCI37Q1XPo8FbSPE+Cf//tu3lfw+YYhrrzmgw0tkmohuhVkGly
	opX0OESFwyGAa537pyLc8Hs9iL/F19yWu+sNh8754wFPDIqSV5h0KjoytS3YZ9Wg
	vUlT0/CUTyOQRzWNpfFbS5vRlccqsSUH47A==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkqa0axme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 08:57:03 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-ca860baea9fso479188a12.2
        for <devicetree@vger.kernel.org>; Fri, 24 Jul 2026 01:57:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784883422; x=1785488222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uY9uni8DTsA+d0nJwe4VSgTG9ecNhKhf3SZ5YEfrVf8=;
        b=PBEgpZJDXn7IhbpEJ5PCNCoT4hAfGABMryVEEZX6+P14YtUq7FvW6wvEly7G5GGO2/
         Mjls2O5wgz42xB8iMfzBtqCmkjwEfzayfIWSFf+9t8VCqQK1yH00zPvikqIvbLgUvfhY
         p4JmjIoSEI00Mor1Zjj1KLymXjB68at56Vhb1YCXfOZboSkH1oofTT9sZDlDX62LUgFp
         bwGEjYZ/w8lgQft1xNU+mm37AbltYUzQ4qVS5kCqEkRdngnXOZd39L3tGwILb39c3aWv
         E5xIrUbX2sDLE9aEK3MY1MbMniolltYOMLP0ciHE8uw47DfVg1jB7CwiBAXcJI+oM6vG
         2B/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784883422; x=1785488222;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uY9uni8DTsA+d0nJwe4VSgTG9ecNhKhf3SZ5YEfrVf8=;
        b=bw3eLc+Rlg+Igjans34abdsaLYtWVO/JodWzf23X6MN8SFOprsdas7QxcfMUZTdRAp
         booQAG9GopHTVLzK5kqQBcTWZWGjEOpAitkieoqr6fPP9g3SAVmzIvJYNxqvQpt8q1/W
         Q/7bQoRjh5HrzKuku80WUTR6eEEjng7DmCLdq+VuDrFomn9kpZAKEaD2tSUr5VdeLCRs
         HKCRGB+n4j2zH60wy9hoE9vVKyh59pgd5p6pd7RyUakuC4a1zG4FI9hEoBNJz+nIBYow
         Acbwk0bZjqNTU/cE6T5DVtV2F2kds1j/6//lVux+jlvQHXg6iZAs629FS3BbVVChpfj6
         848w==
X-Forwarded-Encrypted: i=1; AHgh+RpKBdZwyT+6C23uBKgCO4EFb5rClrQ0NRrK5FavWFfL9/x5lQXb/OmK1QKyJIaHvlJAUYtvoXTdNoev@vger.kernel.org
X-Gm-Message-State: AOJu0YwVKZgc4NiAC+D//57wyWkQm9SosdOMStqFT94v+PaKPyrKQWHe
	fqTYo/cz0IuxE+10nZNBuPsDX4XcjDZ0LrO8oBbJzTTPaMucaxmkO/21/ROzaUMsx+rShpWpmTm
	C49HvCER5771hxhFYpMsW7aA3nfA9B1XyQGhfxONpRDTcEglGjpPniceT8RjD5YPF
X-Gm-Gg: AR+sD12yxrkDVP86mwv8fyUQCVRWzr/Iwb4lTa1GJ95puoUXsRPupBXXVHKgAjDe0ay
	ov1aEqaqEivkRjb4ZarIr9pJf3V4M12oer/8liYfGUoE3U6fU+Jsdwel7oI/SX39reQpXEpIJmM
	KQX5rybiZUW6HX8Ax/qAWJlXWDsSlOPKV3rp7S09qVlZmyJvmjrcHNmccVLw0N1JXzUq4lXWGXm
	dvtOjMAIrQCZ/WhACq2cGaWdY1Enwi+QhudcOUycaEeJ3D0+bjJxd2sd5Wfwp2ud2aCPYtg7VyT
	Zej6MXayFT4xd2Mom1cP1FWJzdsqOuxsWdy1t3QYFKB5dh6F0sJM/7a6bOH6Dph4ymex8+yBtYr
	M12Jx7s/jVoNXZvar9IGs3rmtpkE1/xXmZES2CHjSI2bNnZa7FXiZ2BidWVb4
X-Received: by 2002:a05:6a21:7002:b0:3c3:6528:c87 with SMTP id adf61e73a8af0-3c44afb5083mr7791390637.1.1784883422463;
        Fri, 24 Jul 2026 01:57:02 -0700 (PDT)
X-Received: by 2002:a05:6a21:7002:b0:3c3:6528:c87 with SMTP id adf61e73a8af0-3c44afb5083mr7791366637.1.1784883422090;
        Fri, 24 Jul 2026 01:57:02 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e070538sm27742661eec.20.2026.07.24.01.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:57:01 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: misc: qcom,fastrpc: Document Nord FastRPC
Date: Fri, 24 Jul 2026 16:56:50 +0800
Message-ID: <20260724085650.224899-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: TXQPR-itXVEcb_5RRF6kk1z21FdwnZjR
X-Proofpoint-GUID: TXQPR-itXVEcb_5RRF6kk1z21FdwnZjR
X-Authority-Analysis: v=2.4 cv=e/k2j6p/ c=1 sm=1 tr=0 ts=6a6328df cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hLNpwyK-Jy1qmYTIU6kA:9 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI0MDA4MSBTYWx0ZWRfXx4vYG2DN1pV0
 woNoBsKd1rLdjk25PpHBDTLOwtLEVJkIubGV5hhF+pE0xpdysE/qLwqaBMaZppANLI/1cRA9Z1l
 Uc82/D+zv1Okd7BMjOD6Dd+n9knbrQ+G2AFeiIeFl9RN396ZV99pkEEKwVJ8mQcBJ6oXz1pTdxZ
 GBHosgPMmu3i/vvM45WbObexhByze5+dMFeofK+mElkZG63Hnj6hYcPoqgAXr4bRPqy2E8SjydJ
 51IEzx+4ahWqG/XePcJbYwRS+pj0vS72s9yc4TFZJczsbECs36rGm4dvqsnhc4Zo08fRN+yLVet
 efBMHs9j7dVNuZ4zOHMg7clRELNqCeKb1em86n4ekMkA2Sp/YiJpWH1BE0p1OKa1Q+jfzeyaP2g
 IQsCHg1lqin0QAxObgjs0AkxtxgOO6+yqKzFxFO9n/KkUbFCy9B16XP6Q6J1PH5gWOOPItlShJY
 oeNPzfzMGAuwyI/765Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI0MDA4MSBTYWx0ZWRfX2HrwUQmcwaR7
 Q3ZZZySVqhuM0Bx8tLnSlGdAKK1HNx9SwL+tiYT7nYo0Sz9c+3HbLMHeSqUeGwkp+IcZXQE7GXA
 ZRIvemBnN8Jvp5OqGraS8kzc6quughg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-24_01,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 spamscore=0 phishscore=0 bulkscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607240081

Add compatible for Qualcomm Nord FastRPC which is compatible with
Kaanapali FastRPC.

As there are 4 CDSPs on Nord, add label for cdsp2 and cdsp3 as well.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes for v2:
- Add label for cdsp2 and cdsp3
- Link to v1: https://lore.kernel.org/all/20260709082040.4070711-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
index 2876fdd7c6e6..47e5976c8743 100644
--- a/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
+++ b/Documentation/devicetree/bindings/misc/qcom,fastrpc.yaml
@@ -26,6 +26,7 @@ properties:
           - enum:
               - qcom,glymur-fastrpc
               - qcom,hawi-fastrpc
+              - qcom,nord-fastrpc
           - const: qcom,kaanapali-fastrpc
 
   label:
@@ -35,6 +36,8 @@ properties:
       - sdsp
       - cdsp
       - cdsp1
+      - cdsp2
+      - cdsp3
       - gdsp0
       - gdsp1
 
-- 
2.43.0

