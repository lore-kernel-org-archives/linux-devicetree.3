Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA73478843
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778843621; cv=none; b=Arj0ryBTYIJA4Cin6c7jZexei1Teo51SO4WCjE2QCwaKO9qh1ziaQ3bMliIwnbIL+rIdKGEahO5UZSL48k0yTdU7ScOW4Rf8tCTBKXVENKUsN5JtclWypbjm0dthAkIc8W2HrBBvt3WT5DEFL4lYqMLBQG0cXuZdxVitxqrq5QU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778843621; c=relaxed/simple;
	bh=mAm7OZ3Q46AvH4ISzWOZklD+Q3AQrXYcCXZTk69msps=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=eOuRWJvwP8OSqP3qWy7sJjAsxL4y0Dqi4qG5d4qpQIB9AyuCJ66uf0M1dN6NDFSSdwmPCudPY6vmBmg5ypIsllUO/atA45bofkVs3xufSquT4yyV9UPauHIKRkZp50s/5kzDXdWM3YbZumO3Bw4jbmmCmM8IIjPyyLrG4uMjWJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=b0RhNdLJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EJ9lsKbK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="b0RhNdLJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EJ9lsKbK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64FAffhU3672547
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:13:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=P0CpKSS3GC61dL1Uj1wgao
	JuW5tTwbJBq8Do+OZKSRs=; b=b0RhNdLJ1W91hXLsqigq4BTDnrvHV/Vt2bmFCn
	7tycPzBPmHcj7Qm0Wc6xoOPT+WoJulVDAovfNjhI2jy9UcdKPtQbeTa3GeM/xye3
	FGfRblscTOI5TouhTAV21wagM2fi0WryaagmQEmTN3kdgKSk+d6nxDNL5gkCys4V
	VemGTk0AiauWc3wstryyCgziKSPra+CKaJkhipjWCfc7zB7qOmIA3FWk+y97Kk/j
	Bz3KNLeZJIp/wtDLV2uYkZQ2uvcNZ/d7UEAodWBlASK7pBFRh0rMM7wB+Pl/nIxp
	juFQMIOxxt+WFl2GYQgHGrxe0BnSEHXR1xNAwjdtbfBu+vEQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e5m1s31yt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 15 May 2026 11:13:39 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-514cbe73d00so119952531cf.1
        for <devicetree@vger.kernel.org>; Fri, 15 May 2026 04:13:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778843618; x=1779448418; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=P0CpKSS3GC61dL1Uj1wgaoJuW5tTwbJBq8Do+OZKSRs=;
        b=EJ9lsKbKp2xB6LN1RrY/a3F7vId0aIXHobC4ipLbWoY+Z7Qed79GEz1j9lcBR/zBYa
         Kta7NPBrn6IVgmi3eRuPQ3+/p0OxxRpUYSmQ15+aCmPsXSFf+p9OKcDM/DWj79eWhQZm
         oKxscS7rlwa0kWxZ0/AP7ubzuswfXGwXG5ccl0uKimg2GGx3AAPa1LGwZS39CXcZkJ2a
         zspaVmPZ0iwV434AzlN2LK/v/H6/blkzluk3sUGF1zTC0RkZQfWwDhcPE83eT7rzus2m
         orKcuW43i1kDMTUZ3mhXVaqxtG6cFQLSOPTpF5xZT4f5OM1eOoylgm7xJ6CbeQdq04sN
         uQwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778843618; x=1779448418;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P0CpKSS3GC61dL1Uj1wgaoJuW5tTwbJBq8Do+OZKSRs=;
        b=VVJmAP1plLZg+Nnd97c9F0N84t+4B5J1KKba0AINAwbHZsB4gPYtSJFVThMBPiLcwH
         322hzHPI4rCQcw+ekj18O/LDWMXfu/kD8qGvcgYi6pjVDTNf3FCgd/q/SQjdfVmhk3SE
         wZ1t7c4dFbmEHyxyIToalKvJll42UUSTrdaUnAg6oGiR9K4m5ILEfl3cizJHHS8cEW48
         2Xyr5tv/dLN83fQOynOxU9E6rRuDMKNlyzZFbLLrA1/cNkEZqtbRAD3cDMgKd0XIGu6o
         tUB9XXdvcbIB1waeEuNd4VYT20Jc08TWpF7jjYELHzyhab+p+i72BBnnQCF6GGsk9nTG
         eUIQ==
X-Forwarded-Encrypted: i=1; AFNElJ9/qbLpAmLRKJIosaabtMtPO/PlyAFGCAVIM33OlqHaTRNT3Qx5vKiJ6qUZ19qiS2d9CEYsrexnP0Wy@vger.kernel.org
X-Gm-Message-State: AOJu0YyD7Cce+r+XTyG3DJXd9jPRTq+L0sDAsqwBHTEAB8EdFzyWyZ6Q
	LJfCA99Gp0uAwQTdo79NN8mrVUfD3Ad4XihTwYCMx4QNbgJ/uvhIMBh6tLpu2Oz7jQ3Bbm8tcxv
	Ysl+xz7g90cjPnd2Am03SXoqeg2wWC9simD0i/dU53jNV7GN3UbDLeoqMTdKV4bJh0ffTNqq8
X-Gm-Gg: Acq92OGKamFCy/PjYE1t2dcf0d6xLpmBo9Hw1dcFUw3SeOoi7+Xe7GvwpxhBc9p1YVg
	1QTwzh2iG5nZbsAAofwgKoajTGBDsX2m1RN6o3+qGJn+atsM9DJ+TVXzOCI86XVEWIwZ3/KrDFZ
	G4BWEVnllZ36Lb+sU2o3Cm2jruGy2KBLfEWi5CeKTOOcWVdeNg1aiC8kJp5GsLEMTJ2iRjKReBq
	hvz7UHw1iehWpNwVP0XVVkXO/f1QyToss35HsZb8e+td0CCs5K1phwrRYELvGZbjk3gfuhceA7E
	KDnpmO5VnNeb92JU62eQvkH0VmzTMbAwPaxASXwy8Jtbka0RLX4hkq0jReDq1hwNiQC1jP0EGXb
	TGgrV0atIDugBSIcQe64+bXHHCRhjgQ+1VWRFOVU=
X-Received: by 2002:a05:622a:4886:b0:50d:a987:89b2 with SMTP id d75a77b69052e-5165a0df3f9mr43778571cf.31.1778843618131;
        Fri, 15 May 2026 04:13:38 -0700 (PDT)
X-Received: by 2002:a05:622a:4886:b0:50d:a987:89b2 with SMTP id d75a77b69052e-5165a0df3f9mr43777981cf.31.1778843617567;
        Fri, 15 May 2026 04:13:37 -0700 (PDT)
Received: from hackbox.lan ([188.24.162.19])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe537ccf5sm56497205e9.14.2026.05.15.04.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 04:13:36 -0700 (PDT)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Fri, 15 May 2026 14:13:31 +0300
Subject: [PATCH] dt-bindings: arm: qcom: Document Eliza CQM and CQS EVK
 boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-eliza-bindings-evk-v1-1-8deb81ed86dd@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANr/BmoC/yXMQQqDMBBA0avIrDuQiBH0KtKFJhMdlbRkVETx7
 k11+Rb/nyAUmQTq7IRIGwt/QoJ+ZWCHNvSE7JIhV3mpjC6QZj5a7Dg4Dr0gbRNqr4zXtqwqZyC
 F30ie93vavB/L2o1kl/8JrusHzuGRLHYAAAA=
X-Change-ID: 20260514-eliza-bindings-evk-1f05f1c699d5
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-bc6c4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1046;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=mAm7OZ3Q46AvH4ISzWOZklD+Q3AQrXYcCXZTk69msps=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBqBv/e1aqrqELM6XxlTO9VcfhjQutW4ZQJCKA8a
 P6HkVFz8QmJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCagb/3gAKCRAbX0TJAJUV
 VrysD/sGss1skg0SrZmUWg8nb06ujiJFo9hCR70htYGqcmt+CG0xsbdcU6oWGd8K7eq9rdwh0Nt
 8ABuqnKSRzk8iAtPh93rThm7vQhDQxyDQZMgav+qs9Bh1jShrMqxiA5DCu5hTq2jYN+fp9Ay68U
 s9xK60Lc1V397UbzWWfpqTygmQWoQwFJe02s3su+9MZruVQZwjXpFw4IQc+sOfLHiifqzlFmhqq
 sB4PWMgrWdJeiPsE4WDL0mvLLjUREkGSeYL9wXEKx4MwQ7d8Glt7PtMohGlXfpKPrW3aoROP+Qt
 Vw0ckCqTbdoWj/PE0c0zm2Ip9lcCsP6v3Wk8sUXlFtdjXfRBldOsnkPIBYzDmrqN9lB/8G6aVCP
 xCO9zkH7v4DX9iR21mXo3NNuS9AsWw0JeHjNiGvjfyVdU8ZuoZHND+sjWkz3VTGHwMfX/xPwp+f
 kWhwlEY9haX7ZJQjkxRu/yqGGHDKYiQKUAU8iAc1ahR/Gi7ApMynUBc/f535zy/T6+KZoQbX1br
 xK6w9fjEmzvJgoNq+In/YPHrBOJTxCMUPiBLIweZ0MtewfK0DpfbKDkTzgudyC/tYYyHalwmFFf
 YkFtnpvKISekfAuHJnTCVdQ+G4+ug6Y/EnEaXjwcpReJHriqL5iL68/VXjSGD1gM3hswDkLHpA/
 KJkZZBU7Q40v4vw==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE1MDExMyBTYWx0ZWRfX+p67Ur/bID+Q
 uFKOmXxYVcs8XHg0ij3cvfL/gaW483A6o007Q00XhpxeCNA8t9XZXIpbuZurDtYOKQ47kCdE5yw
 hMtDE2exxdHpGRS9+p1unRp199daKnvWJH8RRP0sSppdORSXx4RLQvdy30mfkeQAH+zxyyblbhh
 b3X2UJ1gsI2N5yin5hlueUxYbnZltyrLSov74cg4+wPsDJ32RPxDITNc1+lGeoJ5t1N6m5D1lIq
 U3GUJ5SQy5D+o0L80XQ4KDYpGW/7MNIX22cNuHHyMCE73NLAYhkiA61ejAs6iLMw//WBK+zqJmo
 ZsUfUu4uma+KiwN+guDvkhgxbbyzEnFrM4wY94CKY3eww7NCKIctXo5w19L+IaO8BZwm2riIFVa
 oDvmtDxpBOcRQn6xCbTpohLYWSAWyK+0KREKI3eslfQtwChauSKfWtOeA0ympojZMnB+5LJyzwK
 Uia1uE62YRPRw2hlAjQ==
X-Authority-Analysis: v=2.4 cv=Md5cfZ/f c=1 sm=1 tr=0 ts=6a06ffe3 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=eYxG+yUyFZr/0hLq1CKHgQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=9sd6kN4QyK7Lnhmzz8MA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: srgXUzOPndz2Y27PNluWVuYwv6-5ok-w
X-Proofpoint-ORIG-GUID: srgXUzOPndz2Y27PNluWVuYwv6-5ok-w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-15_02,2026-05-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 adultscore=0 phishscore=0 spamscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605150113

Document the compatible strings for the Qualcomm Eliza CQM and CQS EVK
boards. Both boards are built from a base board paired with a SoM which
is populated with either CQ7790M or CQ7790S (Eliza variants), PMICs,
LPDDR, eMMC and UFS.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 2741c07e9f41..28a18254b4b7 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -63,6 +63,8 @@ properties:
 
       - items:
           - enum:
+              - qcom,eliza-cqm-evk
+              - qcom,eliza-cqs-evk
               - qcom,eliza-mtp
           - const: qcom,eliza
 

---
base-commit: e98d21c170b01ddef366f023bbfcf6b31509fa83
change-id: 20260514-eliza-bindings-evk-1f05f1c699d5

Best regards,
--  
Abel Vesa <abel.vesa@oss.qualcomm.com>

