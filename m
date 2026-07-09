Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A24E3DFC8F
	for <devicetree@vger.kernel.org>; Thu,  9 Jul 2026 08:09:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783584566; cv=none; b=q8Cx2k3RNYOVCYbyyFOf67tEqC2cTUU24cNE0zNx9oG+etRpG0vFC5tX8GZC4Mz/l7HGaFcTffQfpjFv2+BP8UkdpjAW2haSlfb8kygywvgqjOq6UgkmEdNK+BpYT0LDoCjtqMrIKvS6FqYaJl0jS+k3BZUC4wVowoyvMJOlN5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783584566; c=relaxed/simple;
	bh=YCz2i7HwOXuH/Ngaa7PJAWboiH4pWSvy3jQXqqM/+Cw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qSGmNT+QyOuieTZ8FERLmgehFew5OpssAr08B/eRmQfKzzd7Q0AY4lfPjADbqjJ6R+9ErCRGvbLSaEyDj6dwdfWvpJoaX+razeUxaSr1IOj09X8EA18Wn3Qp4V2A4GkztjFwwBa/1XxkEexkUKO6pGudTZY5zJAkgQlu00yLLyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=J+0mZEup; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NiM7jroE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="J+0mZEup";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NiM7jroE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66960GRI887925
	for <devicetree@vger.kernel.org>; Thu, 9 Jul 2026 08:09:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bwH7TEQlYr2fO36fLAxFhmf1TpHfpILk5AK
	Jrwbpr6I=; b=J+0mZEupU3z22OOwNgmvdCIi5SAZrTqFTlOxi5FomnjUyqFpYvY
	mYRmxJZonv3rKF/xbDIPKXf1CmBeVrR4KhXyvPSp+6bxPgYfj8UeWZOsePjEbcek
	4Ttp7amPvi2QPMlvLbXDskKNegcXlbG9rj0VUZLkjHPwf6lNQ08zfw9VbImUAhe3
	1MLAfZbEJlaiCakkwovYGmO0l3+tlGieJBML2lVM0x5r030rhRXTdHJWcYwwR4C8
	J5lW5GZnjfTkb6VIyclnSrMCbLtEg09yFr4PtgLTtEHZP7jMT+Ch2TIIGVpkHml4
	59+UjDRjUlkWOSVdGh6AU/Ax8Lnzou6mQzg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f9rq33fg2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 08:09:24 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-847a00bcbd0so2149782b3a.0
        for <devicetree@vger.kernel.org>; Thu, 09 Jul 2026 01:09:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783584563; x=1784189363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bwH7TEQlYr2fO36fLAxFhmf1TpHfpILk5AKJrwbpr6I=;
        b=NiM7jroEL5LZLzod45A9oosHr0Sfflfc4jyQW+HsR9PVz/miXOeMpZX/mX9xqzHXtD
         JAd/JENX+favBGXYYIb25h4gnKzBUqc02uUgfgMB/P6BANyOYrFDqmNPWqFDe2EpCmmh
         2kkPMwHNUJ1DUx0nLHJv5VdfGTYD6MJ7zPzZssy9AXP1at8vSTEaRfgSY/zKsZZPbRM+
         Bb5Rv7vwpNuAnF2jUAYUD0kDBQkmMP2cV0gNQ07a5ZiLSJcVWHfysNnBio2rEHxl3lyw
         yOm/2edzDvp3u74nehGpyILxaMA5w4iYvcdULTKks8meZ1vz7T/EBMTPelhVS7feu1eC
         86JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783584563; x=1784189363;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bwH7TEQlYr2fO36fLAxFhmf1TpHfpILk5AKJrwbpr6I=;
        b=bR9jG4AyvwYq3EWd/fRlL8NVYD9DKfLB51O+ycgxHU4ueJ7XrgrdC3/VW5wfGjl9/a
         5PwFAOXHcQmOFfgBrqxpCCocCfDsDKh2lV28UDqabhzWfU71CoDldy5qD2jjPR4JPHBg
         Qi7SshAKpKzjrucrzsN5YSM3rYJp09WsLH5xUKWUw/b/hX7xcnOnqfPFSaoWf3Ie3MCf
         OjRoOhbQFlR9LlPZ1xyZvZFbsRKyyg8FfY9oBy/zNPmmePBFgJRzHaooYbUSNW3DVQFq
         bX9Y2Voe23u+MYBuAtymBwxgYxs/QsXgdXjIHKi3R6cdUnIc/97MKalkBxwDt9QcZEUe
         5Rfw==
X-Forwarded-Encrypted: i=1; AHgh+Rp4C8MIR2Obh2OXH1VqdjM/8Dx1xvwV55Edg5Ok9stikoUAbtom/40SHhC84knqjRv2p6IdQFp6d9Fl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzfbp4o3HgeiqgGlDQkmd5GGY0V1cKt2ziPxnilto8kweBi0hsw
	8tSmb0uZQ7j09TXFVyfhm7WJP7A1sYemOTGX/TuzvD9odW/0jLNupWiHJJuN87lyqd2upxK82+b
	EHlF946IotHZHTG7OLbPJbbOcrym/0cxO4UlJ+MMsNjn8kRI415J/rS4/RwMPXizG
X-Gm-Gg: AfdE7cm81b5Cf3rYMTs32z0DcVVBoe7egaDDL6nX+GQL5hj8XWufuDfrKC0oUXoZXdd
	yVxC/RXWhUgAZkeXWmU/DKI1esJyUsu6FwWavMB5Ty/Tr6heyYu1ba5SpTb9g0NPGQOmpjpcHjQ
	EwALuWmsTAHvmtF8NpGvjyDNztuqiRj8VbiXUGTu6NlVEZtgsSaE8q/okaSQO3yG76udHf0EWcz
	imIpw5MiCc9bQobdP6SO0V5ZjGDGeIuGj5BtTrQdtOsNlA51PmbuvmuHnGiWx0bsUNplhQF4Uq2
	W7tcVfyW69lhc7vfmfVCJ/Zm5rWCNK52XMMkTYMM+IcjvEp/rapgeUHGfT3ELEhOsHRqzJs8+8s
	UY4nz586f4M4gavVJhKXsuBdZ4CGSGTXblXoorpKewr4=
X-Received: by 2002:a05:6a00:808a:b0:845:c662:2be with SMTP id d2e1a72fcca58-84842fec9e3mr5364784b3a.42.1783584563045;
        Thu, 09 Jul 2026 01:09:23 -0700 (PDT)
X-Received: by 2002:a05:6a00:808a:b0:845:c662:2be with SMTP id d2e1a72fcca58-84842fec9e3mr5364758b3a.42.1783584562566;
        Thu, 09 Jul 2026 01:09:22 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a96fsm8177239b3a.46.2026.07.09.01.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 01:09:22 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Jassi Brar <jassisinghbrar@gmail.com>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v2] dt-bindings: mailbox: qcom-ipcc: Document Nord IPCC
Date: Thu,  9 Jul 2026 16:08:48 +0800
Message-ID: <20260709080848.4070338-1-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: MiDOxXdddb6JJouRsxQUKOBrvJEn6ShP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA5MDA3NiBTYWx0ZWRfX3r+lmDwqfzon
 klg/QpiAsPtetWmt6QiCcALQBNdnyjkxYLk4d8fjJIAFi0VjB5PGgnfIq1K8i5mPMKuXSjF4GwW
 ZdnFGYJ0U0CTZc93oDSvn9CldJVnmFAQVS/hOjT/PdZTyq4+GSr1j0d8w0Io+YP+ya3agXkvMds
 r5yhLJMCwhgKPy5EJdUD4UGrDwml9/Dzt/xVwh/e7/oTJo0WMjowNgmgUMCblxHsSp9QbSvXWfZ
 TTLEo5dUOLRXBNj43js/eRm9S8FJ4U2TO2TBp510APVlxuPrDybJIEiQDPhaf6rfNZU2yL+7nsQ
 vMZktlYi23WGLlzWPG0ZCx6jpiEi73HrG4kqStQQ2/R55wQrsQ0xosQTwSkLEzpnnHYjA4ZeJjT
 mBQeBdt6JN36VzZRRg+c5msV92zKPZGQsFnmYoAT3mQ40Z3SyxsVx7zYngLpnznu7Ws1AG+IJZ7
 jj6Q7ny7LdcZ+kJqPKQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA5MDA3NiBTYWx0ZWRfXyTpJNPyLn3IJ
 pvY83YVLkWp6pkih9TA77+TtuuElQTSXK7BpGRbJqHl7JlMz6MsJQf2sc7F3eS43K1CPK4MJoS4
 GZN8I8fDKPvRiH6eUpn+bv7vqWnN954=
X-Authority-Analysis: v=2.4 cv=PYPPQChd c=1 sm=1 tr=0 ts=6a4f5734 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=x3N0ClUllxI611mQ78UA:9 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: MiDOxXdddb6JJouRsxQUKOBrvJEn6ShP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-09_01,2026-07-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607090076

From: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>

Document Inter-Processor Communication Controller on Qualcomm Nord SoC.

Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
Changes in v2:
- Drop qcom,ipcc fallback from commit log
- Link to v1: https://lore.kernel.org/all/20260420040141.1247612-1-shengchao.guo@oss.qualcomm.com/

 Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
index 3839e1f5f904..a378fe8c7148 100644
--- a/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
+++ b/Documentation/devicetree/bindings/mailbox/qcom-ipcc.yaml
@@ -30,6 +30,7 @@ properties:
           - qcom,kaanapali-ipcc
           - qcom,maili-ipcc
           - qcom,milos-ipcc
+          - qcom,nord-ipcc
           - qcom,qcs8300-ipcc
           - qcom,qdu1000-ipcc
           - qcom,sa8255p-ipcc
-- 
2.43.0

