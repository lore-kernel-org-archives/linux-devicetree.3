Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4803A75AE
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438129; cv=none; b=sOdXj/tLg6G9ds3fCenN4UXdjoScwrkZHGQM6VNQLjTDqZTUNg2/6S4E7kIcJbvt6ivnH5gY3QR350vlj0r7KhJFojw1MD1De2/e5Sn/pIPR1q8DGeYOgpVCZAmp35kvzTtl3yCf1wzaStycRbhBwkqBYkwTUOUrLHfcK8CIPJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438129; c=relaxed/simple;
	bh=X+JZGdmHTa+yImR9lFGIGG0JCJFj1fpBHVnJUsdElNQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b7L7BQi7DFdyNzDzDogL6hOw9iCjM/lS89RXlUk1zxZTLVXzHXrkMnXq/ufpcNSrbMcm0snFwWXh5y8bVEAEhJ2LyxRgloACUhn4W574YHb4lfggkzf+7HZsdqQ3YMRrrL58V71MF3/HybKqNRNI9uHk5rAjK/PpDDvspTAaHNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=W+VoYilU; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jUYEyprb; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="W+VoYilU";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jUYEyprb"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64M733ed1298195
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:22:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/UiZEin/CWLczHVZ/BWfU1j5gZYKxKRp02pNX4UGT9g=; b=W+VoYilUErGeURA4
	zorey+mVaIAtbttEJ4qbdsI1jSsvzNwRwYL+eS6+2xhXTygb4QC3LwManhCnXlsj
	7LL5+QmsqX9JI92RsnoQ3NkP7+FILeKm64E3cBEhDYUv8o1kOgY0LG6Haz2+0yEN
	AtfZXK6a18g/eVzsLyCHYfLEGRNOvqFGRmaxEKSN61xmdLSa3ivM+mczg6CgRJj5
	WludiZ28IpHQl5gNH4qi+R1wltJqB775KslYlcudx6uTGSGEFGjDnhwkWNV82QGn
	PxFZvDFDA27GFPmy91gbbJgJGWsW1M1gkMu7LopFNMnCbS4dERb1Jj/kXZQXBs56
	KAavHQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eaah09xbq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 22 May 2026 08:22:07 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c82c477290bso3797501a12.3
        for <devicetree@vger.kernel.org>; Fri, 22 May 2026 01:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779438127; x=1780042927; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/UiZEin/CWLczHVZ/BWfU1j5gZYKxKRp02pNX4UGT9g=;
        b=jUYEyprbagYfpRh7BqmuExdy88LKLUdSQQuxBJ4CRuWWUnHRNTCbROBf7dwOCzjXZ6
         Dird/8Ju1/KptjGJrPUFbXZXziXlCsq4AK+H2GPDLKqz5Le9sprjHsAG1LmePXc10Byt
         WVdhuU/M/mdz6Uj61CD83pTWG9mSsJhgGM0jWo4jOIU25IWc1r5CQOT75fn7NrpC077x
         74HFMzDSlOlYtx39LwUQBDa08jzLHT50FoA4J1SIepapf2ZFaY6ss8nQHbpxD5jQ/U71
         z0bcxlOji4r1gQ/r83fRKUXQ3S6g+yBp0NUQ5uAoBDuxsMJ6Tg98jn2OTQ2fROkBg0+k
         o9tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779438127; x=1780042927;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/UiZEin/CWLczHVZ/BWfU1j5gZYKxKRp02pNX4UGT9g=;
        b=pYDcIMt007N9CxGcTDa6w4FOLtxhO1MSpDDFhqFGKV4TxDVfYF3Rpk8hTkPl60cgYW
         4wsYfvnMED9Kq75V4R8bwRPPvGuvVhNQM4Enpq61N7u32upeRVmbrfMuyAJphfvmPAUy
         5giaGeR4QBTMeXp/unVnPby+P3Dcrj5LNpQpfHzZ4Gt0MJPjB3BS7DQFmlHd14SWG+rC
         AXShfqd/Fww+uNPXuh6XzjsTm/iMhiKSIyKb7Jj82F/NX2x2FpKbenRb6JDWn/s3qIet
         5zbdXAKg1mUEr1TwMhAgAIveptoPxnudYFXFihELhfNcG8gT5hBjl4gSm3TFo5SLbFlc
         CvMA==
X-Forwarded-Encrypted: i=1; AFNElJ9XfwIyI08rdPlw+8vxOMlNYqOZ85NaZT0wLfO0ChUXGVMBqvaf9ySeOoDcYFEK+Sa5yl6PfzEnZe/t@vger.kernel.org
X-Gm-Message-State: AOJu0YwdWKrEWiLFVkUsxMpf0QvUREaR8z/cW1F+J5uea4PB8eupshY4
	8e+ymPHVDbodLcLWkozL4MZEFYykVMAiBelBnjZv8vRoVOl9BabT/5RVK5ELG+dRyoqFNUEjY1Z
	dTdrRKPPjMyZIFmUygIs3PTRYENIUmuFBKHZ22i1i926Tu0jJVV1RaXPBiwh6Lz6bBzAOPsU=
X-Gm-Gg: Acq92OH3HTp/Mlt3LUbytt6VRgO6lYj4F4Fg0WnFlXhrXNmNjQWA7xJU8U+wdX2+occ
	+XVra8raW/pq9DgACTk1YMbdK2JhQwGiB37w6WNAanE/LbRqmP2Q0j475TJ1NSs3QGM1gt85QRD
	6dixevLpq37LCguWQ7r2WnrhPUtLyPumq0CP7Vfpgu7/hPz7icbV8f1VicBJrJFL5CgBmsJkgmd
	fCsqSQI3P5X32BprtlXUE03b/g7j8W3sgzJBgLeao9Fzf8KELkW1W7UqzGIAn/CQdykE+m1RbUU
	taylwhOvhWEtmOv9051ePnaC79rQzh1ZKkXsfXMolXK5vxGZ9TElVLED5usBVzmKeeXsCcQ7B7y
	zlsSk34ArYNrfE+MBfxj4sOpXWYmBHoxILbeRUX8vX62FZmrO76Q=
X-Received: by 2002:a05:6a00:2d25:b0:835:3f51:72fb with SMTP id d2e1a72fcca58-8415f5aef23mr2812325b3a.12.1779438126923;
        Fri, 22 May 2026 01:22:06 -0700 (PDT)
X-Received: by 2002:a05:6a00:2d25:b0:835:3f51:72fb with SMTP id d2e1a72fcca58-8415f5aef23mr2812293b3a.12.1779438126382;
        Fri, 22 May 2026 01:22:06 -0700 (PDT)
Received: from hu-kotarake-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164ff3e00sm1431407b3a.54.2026.05.22.01.22.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:22:06 -0700 (PDT)
From: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
Date: Fri, 22 May 2026 13:51:54 +0530
Subject: [PATCH v3 1/2] dt-bindings: power: qcom,rpmpd: document the Shikra
 RPM Power Domains
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-add_rpmpd_shikra-v3-1-632838e2428a@oss.qualcomm.com>
References: <20260522-add_rpmpd_shikra-v3-0-632838e2428a@oss.qualcomm.com>
In-Reply-To: <20260522-add_rpmpd_shikra-v3-0-632838e2428a@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        kamal.wadhwa@oss.qualcomm.com, jishnu.prakash@oss.qualcomm.com,
        Rakesh Kota <rakesh.kota@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1779438117; l=969;
 i=rakesh.kota@oss.qualcomm.com; s=20250919; h=from:subject:message-id;
 bh=X+JZGdmHTa+yImR9lFGIGG0JCJFj1fpBHVnJUsdElNQ=;
 b=BhOwWKcZXaj+bii894zWz2DgvnRh8vw3KUhq0PJSU0/K11QS72WJXCZS9TcVVOFvTiwoPsRZk
 1rwtcnPhDC1B6fK51EyBVuvyLvGSQlcaTZKTzKzZYOwDvq7IKna81Bo
X-Developer-Key: i=rakesh.kota@oss.qualcomm.com; a=ed25519;
 pk=dFhv9yPC8egZglsSLDMls08cOvZKZkG6QQn1a/ofwNU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTIyMDA4MSBTYWx0ZWRfX/betYuDiM3nf
 KrhB61wEmUR0Spp9R4RZkx6Gkho3xsFQmGqNHVQVvd9ryMJoB6oI8U/b3Q18cTll33NdhAxZLXS
 mBLDQp/htBCQ8FbFwKP9XrNynMB969yKqR3Ax8c3/71LROcMkXDArePlUzrcWGU7gcBY1iXd3e5
 MsptNTb1pmYdLnMsnixcMgsshpWaj9EoUaC3QcwZgnVsoOpjltzbGbj4nCGOY2vxYgIiTTl4l9c
 cETyU12s1+61bNo5cauna3SuJOVa4IErlUXT+XccKbSCskEfVhhd//yeOpVOKP6sCKRHgbrY8i9
 sLt7fGuM9nm/mGzv38seK58+r9O31CHYY1kH7g+7YCyvWZ2Xr1ZCrb6ajZFGPoJKByYCqrE0wO4
 Ee0MyNj3Oypz+r6cnhkOS2BBguLYQbLiCM4e8MRaP6XwHryTQxaSaJfwuYJM1z+aK005aMj/0Af
 3PGQWFTsljRSLRGD8kg==
X-Proofpoint-GUID: 1HmtdvihGEYGDQaFe4qlBmCe2qUqZ61H
X-Authority-Analysis: v=2.4 cv=LNdWhpW9 c=1 sm=1 tr=0 ts=6a10122f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=jkam1OttE9FODJyLpI0A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: 1HmtdvihGEYGDQaFe4qlBmCe2qUqZ61H
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-22_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605220081

Document the RPM Power Domains on the Shikra Platform.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Rakesh Kota <rakesh.kota@oss.qualcomm.com>
---
Changes in v2:
 - Collected Reviewed-by tags.
---
 Documentation/devicetree/bindings/power/qcom,rpmpd.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
index 0bf1e13a99646c0325b03fc5b3297ebada21cdb6..1abb4b733fe79dfa267e953f48219093ad759330 100644
--- a/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
+++ b/Documentation/devicetree/bindings/power/qcom,rpmpd.yaml
@@ -55,6 +55,7 @@ properties:
           - qcom,sdx55-rpmhpd
           - qcom,sdx65-rpmhpd
           - qcom,sdx75-rpmhpd
+          - qcom,shikra-rpmpd
           - qcom,sm4450-rpmhpd
           - qcom,sm6115-rpmpd
           - qcom,sm6125-rpmpd

-- 
2.34.1

