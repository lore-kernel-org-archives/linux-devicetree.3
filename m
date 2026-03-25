Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359BF359A86
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774478105; cv=none; b=UV0/bTtki/3T2rR3Q6ssNjg8zpom6iFsTHKZhKDiRjqXQzystTyM/0C1M15OIMCH9vFxCtD0AGqA2nCH2xnrmJE43MPQJxcaepjAQKfupBPclLbVfI0A/Dj6N4HXzrFjeluAESPgstYC8P8IbIpEEr+ZAI3wCfZZ5ZxEB+WfETY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774478105; c=relaxed/simple;
	bh=Vsu6yvOPj0Ebw9fWmhi6DvD27dNsT3H0Kr/1dRZe9G8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kIXKVAAS8MTPF12XzZMNBDrkFs+5lZoqx0LbcjQEzjodhcCP1L4MnzSmW/SMYaTPzPYj06XZpxkBHSwZrZsR+L7UOND9B6eOI8Br/WpM1brILN5TbhuUipcjo3qOHfXLsVKVnDOgyj0pGVvqBDvtBPd+tEhLC+DqMmAZVwnBr6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ku+XI97H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CeeMvO9m; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ku+XI97H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CeeMvO9m"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62PFRIdW1432136
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:35:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cSsuaR2zlios1+Mhi3FYYdxcb1QOyHXrIYv5McWKyVk=; b=ku+XI97HO+O8wvbI
	0GAxSQoyHHh5QQ+hxFCw4TMWXfz8l53Y3TTMuz4MM8uVODAzHQmXGn4SWxfER7Q2
	lUbHgNlRue/g3q6LG798XAKJstgpi9bmcExUgXUIc6tJjdJpDUjQvv2OcJFsdRzF
	7VXo1ir3emv5xpTNukxowtNkbCvOqLyRr9PNksmqOL/0I+/7hLP/5Ku0y4sAD38P
	OELt3iysYK80xKJLJ+5XRCAWtFmRD+MyiRtv3CmYsDbE30solVN6+nZPCK1lcuQJ
	K1yuP7a2Sn6yBYEdFrKxbV/oj8BUh57hbbTagggh7nc23Sp+KKfYKVR5NXFrGNeV
	/hK56Q==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d4jc51feu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 22:35:02 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-463ee33f9b2so386616b6e.3
        for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 15:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774478101; x=1775082901; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cSsuaR2zlios1+Mhi3FYYdxcb1QOyHXrIYv5McWKyVk=;
        b=CeeMvO9mHy/yWvY41WMP3AjF/znC0hj7bWI3Y8ZbWG/PDzpld209R75HudvHLSSoqB
         866pBigDgOIKnTDxYymNjrnd3eqNccHeOogaKW0Gcd1Ipmh6gqpo/H/GfaJ3EP1yexCL
         tBuszqsiiLEFmnGZ0/B4l37UvTeU/5/vpOFegMHTppTUHFhiOnZ1qE1LuxL9b6Y5VtY+
         Sgs2yP6qBXAjpDdk8qYL35o8Wy28OIHqbQGB0qHKLdoYuh0rmlBzyWNrJ5s/lkc8d4re
         C64d/HWPTO4PDem8S8qn2AIUc+3MdZKD/k8zbAVa7dJxVfd0N0XxZpWnqWPw9ICJol3T
         p2qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774478101; x=1775082901;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cSsuaR2zlios1+Mhi3FYYdxcb1QOyHXrIYv5McWKyVk=;
        b=mWc6aa5Yn+lTehgRR8wTuoESAxu5mPO3yUukRN/SdPs7AgnbGdF7ryYi0rseCeAV9o
         1acs2fHrGSH4l6W6nYqhYM0i1VOyfvXTRQFnwyUefeu3Z8K7HJ3vKzF8zc66H5546LDv
         vmUWIxHdrkvvBjI8t/LWhqeukXXphKXQNQwiOn+D30EIBaNZ7bFa4Di9NxUdHGYlBTq9
         AslHIpnaWND3X0iLoK//fVfZmM/g4Pv+9kY8yd7cB/ymd1aNDBYPC5J9DVOi5ScUjdyx
         5wuAAIgoRN2VqobtS+GlV5rN58vCFHiPELTAgwhxG1M3cEmyyV2GzPn4UTLfuQzqsRF2
         N+Vw==
X-Forwarded-Encrypted: i=1; AJvYcCVKCGCYhod37Tqg5wIJxVBmYQlyzLPgFgGY/m8MHSu/PZiUZ5x+cLHMb/xLDBjFJH83rqbLT2Xfob0V@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9MSN8SYA+liNg2OtncJGgrZIwbTOTQ6bgVS0Gc03cfW3/Mi1H
	sG4e/yc4bZnO0SsXxSf3+IeB05dLeWF1IwG4AyFyknkA/yuDIK6uqS5+oHpkuMRLSMytMyPmboo
	b1X7W0285X882rddwBLU6YupwuJGLaDHtFalO3WpAf5WPUEmfM6e5LxCPO53xtzPh
X-Gm-Gg: ATEYQzxrOo4c0MGgbTZW7HkTIgrhnbX+hdYzwd5jeP2jb5pg190zWVBKs9u9GyDB71N
	iUdlqA8tvtu6FN034x9QkbOZpDaUOvlFBU1rKt274vewlDFhppDZlc8bSe/kvg2eA+UEm4lsYUo
	T2IH8CMTsj2HkckOfS8voa+9fhWKsoRPNfuBfJ5HBl4bGDj4CwnISWLc9+ruVneccvsQixoGElv
	l6mtwyUtqIbRWchXY4jAj1+BwZ9eoyuYX1FnLQvhME2feYxG6mJ9+NSV2r5MRi1WMQ4Rn7QY0cb
	AXav4vOTOs+y+ziSR1qufg2T/vclNESHDpu2Co9C3Gvq9YdJGg6ogAqEaYA1TPjhnMDLTtqpVNZ
	vjDTX5tNX7XcAOrPDGRIFPZRrOd9Gs609AtHkBRIx3AA=
X-Received: by 2002:a05:6808:c1b0:b0:467:1e5:6764 with SMTP id 5614622812f47-46a5c7c06f8mr2524449b6e.54.1774478101516;
        Wed, 25 Mar 2026 15:35:01 -0700 (PDT)
X-Received: by 2002:a05:6808:c1b0:b0:467:1e5:6764 with SMTP id 5614622812f47-46a5c7c06f8mr2524435b6e.54.1774478101153;
        Wed, 25 Mar 2026 15:35:01 -0700 (PDT)
Received: from [192.168.86.59] ([104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-46a70634941sm565790b6e.3.2026.03.25.15.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Mar 2026 15:35:00 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
Date: Wed, 25 Mar 2026 17:34:48 -0500
Subject: [PATCH 1/3] dt-bindings: arm: qcom: Document the Lenovo IdeaCentre
 Mini X
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260325-ideacentre-v1-1-768b66aaef30@oss.qualcomm.com>
References: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
In-Reply-To: <20260325-ideacentre-v1-0-768b66aaef30@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1092;
 i=bjorn.andersson@oss.qualcomm.com; h=from:subject:message-id;
 bh=Vsu6yvOPj0Ebw9fWmhi6DvD27dNsT3H0Kr/1dRZe9G8=;
 b=owEBgwJ8/ZANAwAKAQsfOT8Nma3FAcsmYgBpxGMSurcbSWpzV7iaIWqSij4EBag0RU6PFBqxW
 WRyUDc22NOJAkkEAAEKADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCacRjEhUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcWOig/+KIZp2YZyEknnQ357s7+Tlq6hUgIFLN+WnHjtA8U
 jNzYSJdA7HRqpjk/gUUAA/vx+E7MLqQBE01i3CPCeIoieEmlshGmEc4OJgS/97o3YOKhSTpiRD7
 UeJJjxJ7XX1XrKCGOCdWxjNcdaZk7ARP+SYCHSKhqq7p+sSSJuFsqTzNb/j9mrkIiir1DnoX4Rz
 SThixOPPn8GrhoHw5Ud0bXiEKmhBI8nuNH2eibUrhpNUBL98ExVrkdF+Ik+G0juwaxxPftZ9u4x
 ai38Bkio2w2xVUIz21DPyK72RJZiehpTUPo23K1rreiCFyDYrm3PyP461Lc7yzzLuI9G4Cxt78H
 TAZIb6rU7EUdQmuuYBJs41w4FnfDrnJ6S1bcSVq9nvC9Fah+0TcB1CwB8W6jCzRwSQQsJ1of/hF
 tedesREW5tsk52spexN/dW/MmrL2ZyPSAUmZW4XiiQvc9IapZR+Dk5H6sifo7dgEck0rRed714c
 SfVaeDvybZD2CYsnLtNQYjYXS4ZHqxR9w+5P0wr1JTl5kGkgr507wMxtwb1KO2Znp7WpFE96bK7
 dPGUPI68azxMjsM6FQFjMI8XiRxDxV7YmJGY9+TwjmDiVu9VrdV8xxrxkuuExvAS9DDB2QR3UKv
 liYYzXv4eQOAyHmOL8Et1liTmW3PBNAYvKkCnikkZW7k=
X-Developer-Key: i=bjorn.andersson@oss.qualcomm.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
X-Proofpoint-GUID: SnY0gQSK9X2rjrjlJ76vDqsqUUaSkt5L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDE2NyBTYWx0ZWRfX+aR9ICYkvB8l
 PSATo17LlM3xl5POGW7oncBSLRg2N+aZrBb1Q9UCVOwi5BfbHkUcPm5qob8vN2m/oKk45TSzziN
 6k4WvXWFwoW3GsGjsHH+zQLiDotQeyqagLuJAsCYtCPozxOCizzF7Muxal86e+/CGQ/giRKk2Qg
 jagxFZvPJ9Lbxg/qy719HW3/aGIHMyBOqMKL1aLd5s6S2ahOO/DUYeEjnzsmSVwdji7q9uel6Ne
 wJlA0cBpd4HLZVsJcbhlL6hiHpo7W+4/aYiOaZVtpdND85y4zWODqFq/8amQFsQcu9t4cDFD+SV
 Y+e9/NsWQIDe0Mll+LkWBgRdJk+gY37fC9e5W697R5RjeJcgXdzUQfP67GlMMT8zhmQZwzDmhDW
 qu+hDI6UoNn+fRmwGabBjvbxnSiG7Du/bdrUd+cABvfAOxu4ACle03VxdOWQfp0eXRmikQqp2Xt
 je+KkBqKNhoooXJP8VA==
X-Proofpoint-ORIG-GUID: SnY0gQSK9X2rjrjlJ76vDqsqUUaSkt5L
X-Authority-Analysis: v=2.4 cv=KaLfcAYD c=1 sm=1 tr=0 ts=69c46316 cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=DaeiM5VmU20ml6RIjrOvYw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=RTJPypKaMN8Ns2IMXk4A:9 a=QEXdDO2ut3YA:10
 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_06,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603250167

The Lenovo IdeaCentre Mini X (Snapdragon) Desktop is a Hamoa-based
ultracompact desktop PC. It provides HDMI, DisplayPort, USB Type-C
display outputs, 5 additional USB ports, Ethernet, dual NVME slots,
headphone jack, WiFi, and Bluetooth.

Document the compatible for this device.

Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 9f9930fb9a5e9cb76f508c1f2e86da6ad9bb44e0..0ab18e9b97ac0c6df0f069dc5b985c3df48f09d5 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1142,6 +1142,7 @@ properties:
               - dell,xps13-9345
               - hp,elitebook-ultra-g1q
               - hp,omnibook-x14
+              - lenovo,ideacentre-mini-01q8x10
               - lenovo,yoga-slim7x
               - microsoft,romulus13
               - microsoft,romulus15

-- 
2.51.0

