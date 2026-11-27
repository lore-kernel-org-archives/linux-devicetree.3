Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795779831;
	b=fc1SX39sp5xzWOw3RX1kupRR//8wTeLYR77Am3/xJTdqojCObral/2clZnSlcuT8TTlW
	 gy0whGU6/QP+ehzks+02+hNMfCwjHTW+EeBdpjLamdr/30HSB/s+xbQ1EJ12VhHBLwHhJ
	 LSKB9T/YayifjxE3m8qCY2cXpgDHU9J6C85lTZDPD9hQcpZC5iGd7kAssndGvvkL85mzn
	 3p9guB7Ke5YH4Umqbe2yuSWCpDOkGWTzND6Lx20edmopigbBSJoFLQ8oeEOhBcSfDdR2U
	 E1cBbM2374oZtkGMkAwsIcqkx4He9hhDj6qHd2JO4PNNmC4vOV6cH2xybCYo85Pm6Xw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795779831;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=2FWKC11Q8JRJxyS1O2rUXDgWS3Xb/e6DBSv/HHDpm2M=;
	b=2KMvsW9q1vtbrTekFRs+Dil7elnuKNmBbU49Wj6dz/DeeZc8VB5TeuqGLTbyYcjaEkVD
	 hL9G5TMViUJkyhybQRQH+0441ch50LeEaM/ncvfiJNrUcHRUfqHnRisAcbqUVNt/5i2UT
	 GwSco7JFntLQR6TTiBuxysoQsBKOmBdprqL7kZUgZhjrfR0mO9uRz1YO6OfKLv/meCDxl
	 tKd+Le3d6jM9XR0G6tpp+mkN6B6et22S5YgZ+gziWnPT3goMaE6AHdu9pl8TQ7m1GrP2L
	 QuTAX/H0r1K0zLX1t134JWlnefbb5Olo/k0td6OLa20CCIJh01WZbA+XxNou9MnZq0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V00wB9Zs;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GcygB+Ec;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FF3606A31C
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:43:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60FF3606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=V00wB9Zs;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GcygB+Ec
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARApi1Q053015
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:43:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=2FWKC11Q8JRJxyS1O2rUXD
	gWS3Xb/e6DBSv/HHDpm2M=; b=V00wB9ZsquyiB/MvUSl0UpAYI3bR6YQ6VMUBCJ
	yDy8BYmFR5LXnM/kw+FUplzcR4vnTzVbLYSQDPGK0GIcj+0b5l02NtDWAoYO8ZkG
	H2T8p77B1P98DC2krk8XDcdaYQTTbm8e+Hu9YKcO23DzE6XSMUO0hF3KgD8kzW+x
	Ya8BJT5eLQ7zz7GS7ZcAXIji9jWC5MUhWaNddOehzBpskjwnni/wEUqBT5S88K4c
	aGN7Fj9Ludv2CP8BH9Vh6PZmTTea9IqxVIiW9JuEHFr9YoRys9+fZrmZh1MpbE8C
	ChE7FA+ySIoIrBuKlmZm5wS1BU2XxDmnLvC5D+N2R+1L5ldg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j74g6s8h1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 11:43:50 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94960bd17b5so1251325385a.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 03:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795779830; x=1796384630; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=2FWKC11Q8JRJxyS1O2rUXDgWS3Xb/e6DBSv/HHDpm2M=;
        b=GcygB+Ec+RQxa+AScsyAc7p6mPqlt+HKObVcl0gfS4nw+/N5mTRPD8gX7yno9LRcBy
         LhQa/MC02jOc2N2Fg7aeTK6gO8k1ZujL8Sfe+h/8bP88SgRtv/vmKlnFdTMO9qB8F0tJ
         kKkuaw5BhCGIEb1lGGFmnAl+FUmBWCyfesvg+n5n+avgixWLc8OxFn35c+L+i/XDu3uI
         mXAEt7vX3kUetRJAOxdO0mhaVPVNDORbqvC7DUr0FyB057N7oAJTJPJHsKC9MQRvx4Rv
         pdOubsuphwuG+3R0MEBPwxnViWiciacQ/rzRMV8m0J/DJ8RkCUPAsDOwubKvuYFnb4CC
         vR2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795779830; x=1796384630;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=2FWKC11Q8JRJxyS1O2rUXDgWS3Xb/e6DBSv/HHDpm2M=;
        b=aE18jz29n+aC7PBbApDwDi8vVmra/VQVAPCx6vinvLmCXH2Z2hQzJudor+R+1R4tEC
         BY0KKjz8QjHlzFDC1GvVUn+FeT7TReiFozSyR9RytoCd0QalYurQF1RmSwFk+eZORVMq
         cTWoLz44HjewRs95zaEoqe3gQ+X3b0a7QMwXx00Mhi6cyW1iyxUiJVANI3bP1jyEks8/
         NfM7fkbS+OVGrEXTVBrU2BMTY3PbFvJ41BwbdvXguN/gJBT+4hfO8hU65wTRnHpMWa+2
         pyjDGXWIBQjWbIAsfew82ZkZbKvGaCENOVoBnbbONpEO4EhGr+GJ75f1XwcnzddTEhbT
         Dwog==
X-Forwarded-Encrypted: i=1; AL+hErGFmyE6ijtqgvJDvqZIrBfzNsYXwxZlaoVjxe9gzs6LWu0qHKSN35sAQlJKFGu4A2Nau8M99J3ODQa1@vger.kernel.org
X-Gm-Message-State: APuU4Z9eWEEgdeDJvTUJwjTN0JNXg/9XbGkpOvbNGlbBVynBhRygg37u
	0/o70NXTpfUk0ipn6tAc3zJQXvvCv0iu2tRt2fGG4U2VEnZ9+e5GyB+i9ZazhYp+2s39zcglOM9
	BXdZgzGL1zVr6uuENb7SGuiQDJjtsS/j9hq+3srivhFGIsdXwPqBQECbuad1AkV7P
X-Gm-Gg: AZFdTZdGEnNrW32wFbelgv4BWo4yvYSWpd47tq78YRCOqkHxWGoJ79TZ/n9ZogXG9Yt
	tVzIsSUae91H7FW/JETmsShm5cmQ1q/kMRs5uyc4oDteYEfx4Z/60DnDN6uYS8DH2R7hh+NkrDl
	ZvmIxrR4QdBHvB3ZkCwwOwfsmKbo6pcPozr6SNISBmyjdiTBXHXgsTacDsvB1JSwXmKoXOFSX5W
	k67bT8vGJLQOVbDIWGcd64mBbPw92Dut77DhaTFTdYphQ9A5XbJUO9ZCtnMGamHB2OVNd43OGL3
	udg7/b8UoZC5AUiYUEZWR5P9IUsn3qvzYA6qCvKQ2VW3QKhfKAR9cP8YtqEhrEMtQEV65n7gF23
	i1cYlkevzZXRgDy/odJMgxfKpPmCQQ0la8LgiD8WFFDwfzxPEXdgputzQKzXTHoRPKvq5huruE/
	I+5ILUySl+Xo/1nE4tLiXwTBZqF90nkmfYNICTxZ1Bos6FhA4quQyLImprh9a9fpk=
X-Received: by 2002:a05:620a:46a9:b0:949:730b:53e9 with SMTP id af79cd13be357-949ba98d292mr4242565585a.31.1795779829372;
        Fri, 27 Nov 2026 03:43:49 -0800 (PST)
X-Received: by 2002:a05:620a:46a9:b0:949:730b:53e9 with SMTP id af79cd13be357-949ba98d292mr4242562185a.31.1795779829004;
        Fri, 27 Nov 2026 03:43:49 -0800 (PST)
Received: from brgl-qcom.local (2a01cb1d00dc7e0089167b9b97a26c96.ipv6.abo.wanadoo.fr. [2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b110ba3sm38340537f8f.35.2026.11.27.03.43.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 03:43:48 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 12:43:46 +0100
Subject: [PATCH] scsi: ufs: qcom: dt-bindings: document the Seca UFS
 controller
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-seca-scsi-ufs-v1-1-4af7bb40c4aa@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAPFsCWsC/x3MQQqAIBBA0avErBtQiayuEi1Mx5qNhUMRSHdPW
 r7F/wWEMpPA1BTIdLPwkSp024DfXdoIOVSDUabX2lgU8g7FC+MVBV1cwzBGtdrOQW3OTJGf/zc
 v7/sBPCqFvl8AAAA=
X-Change-ID: 20261127-seca-scsi-ufs-afbd89f0b74a
To: Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-scsi@vger.kernel.org,
        devicetree@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1523;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=fIatVXM2YMo39/HpbLiSCfTsiSk6gCOVc/Kg3EAaVIo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrCWzz3ZCSNuHPktUMQlOMNuBxnVZpxVX8rpwUZ
 +QSWQaLzL6JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawls8wAKCRAFnS7L/zaE
 wxarD/4h62VN0p6xtqzVT30rV0ZldJpxzPlhGL+ar5plW0Nxj6Jj/oquKk3A5U4d8X9qmZsRX/B
 x8b6e+eD1vBxVbi9ynXsSwf2meZXDUSL2InmBVBrzBSfSJkotelAoEC9/Nzxxhxd8TBEu54rlRM
 p4oRjlHF+z5oBb7PnvzUka0hH4y1nvYmmoGP0zuypnDk1DFsXFXQe12foqv+/n3qYYZY0i3j15O
 o/7EyR3Yv4BM3Bbi+wSBwLT4mizoxkhv2gGtBoGxBBym205Z2aK9ZepaPN/k1g6vG9qn3Ej3ur7
 7LTmdEB1+tkJS471QY1bvPTwmnFuIUyD56A/VWX2BHcol12v5+5fViV7uItodKuZ5S3jK246bNO
 l4hSbPOdlt3ScpaAKc4Omxuq0Oi8jHBns3JyygOfE1QldLeGXQnH0+Kh0z/TI/iy203Z0ivqG7p
 KFMFDqHlgJYeMY9d+j3y59rRw3Tyeb7z8ThwnpyiGhXXhQi2vnQNBFlECG11OX2SIKbx7H5H0MF
 Vn65KZHdfO197guJ6rxxKnhpLQoDOn2VC9oUm0gh3Fh071mkx+kmZO4T+ui6Kzgyb1aZCD01zxW
 NOqytgtsf096E8am8R97JYjib/gIvKFWEsWpxEHcAdmjzgERDQt7cqzGbP2WcnnfqZZU51PZre5
 AYb70ucF1bbxa3Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 3VuyspMwEeso7NAQ26wNr3Lhp64CjS7F
X-Authority-Analysis: v=2.4 cv=U5kHnuru c=1 sm=1 tr=0 ts=6b096cf6 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=dQ21c57GlSjXnCoPd7EA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX8yS8kS4RvQ8b
 i2+K+OB072RfTM8gGm88M/Jw5uBK6YBLfwaabNjqsVunNyzThWm5GbDDf0xCHpJ5tGuXy/3sAIX
 Wvd4vdTZ2ZkPtBy5WEvkt+MVGNlWkbo=
X-Proofpoint-GUID: 3VuyspMwEeso7NAQ26wNr3Lhp64CjS7F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA0NiBTYWx0ZWRfX+dV1/N0zWMlf
 FZEmzxcPunJdPr6GK0BXl93KoD5KUNSzl7z22d1iHz1UAdGffXbc8MvWtlibOYXhqdYF7PYIvRJ
 qWknWE78PdHv18mDZY/qSf7zSr8JHpDkhSBhesBtlGuV1uAw8Rcej9xaXAaFfAgeflFU4VP3xj4
 eApnkXWJz0i/X2yB1pI58UIHMV2h2cfa0+gJTLRcZA1rktUYiuFd4kf7w63EyJMdBflGwTUZ2qt
 eoK/RdCDLgs4ULduOGdadlbuXxR3BSlrhv8EM7ZVULI8pcmFcdf3cf2/ELC1AX6MywoxPzaffSO
 PF5biC/Gu1WSTKjNSR1w+HnLwooI/XeSEuCM3izOuMPLeja9GqJ3UlLk7OpsbfLSL+tF1oOtVRy
 keMaythEmthdvhcFlfVrPkS15ikceTKmlUO0V5wTNAuiwvfcLZIy1FeViwPeyIz5BL8FB/2wWf9
 TWIWCzNnr3x3TgKYzLQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 bulkscore=0 impostorscore=0
 adultscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270046

Document the UFS Host controller on Seca SoC. Seca uses the same
IP as Nord.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
index f132b1a9ebc28165ebf3f3b74c7b110f5bddeca5..511de834e1c7bef2ccb7f49e0ea193353cb9dd92 100644
--- a/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
+++ b/Documentation/devicetree/bindings/ufs/qcom,sm8650-ufshc.yaml
@@ -21,6 +21,7 @@ select:
           - qcom,kaanapali-ufshc
           - qcom,maili-ufshc
           - qcom,nord-ufshc
+          - qcom,seca-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
   required:
@@ -36,6 +37,7 @@ properties:
           - qcom,kaanapali-ufshc
           - qcom,maili-ufshc
           - qcom,nord-ufshc
+          - qcom,seca-ufshc
           - qcom,sm8650-ufshc
           - qcom,sm8750-ufshc
       - const: qcom,ufshc
@@ -85,6 +87,7 @@ allOf:
               - qcom,glymur-ufshc
               - qcom,maili-ufshc
               - qcom,nord-ufshc
+              - qcom,seca-ufshc
     then:
       properties:
         reg:

---
base-commit: a9c48428cbd8d96b26f92631d0db6f8519c5fcc5
change-id: 20261127-seca-scsi-ufs-afbd89f0b74a

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

