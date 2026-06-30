Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C326C3D16E2
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:10:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782803446; cv=none; b=AXbSaar242T9R8BpR0s4w9vCs2ZZ1bwM/VPX4qVK5WUXvtSbZvMJRCAATG8A0CIu6MM92hw8uxUD1R+BZjW/VPzw5NU84z9M7IXXF1sByXFh8innOR/o+o8b64/nkYZ0bZESWJizoKHi0leVnAC9XSEyb/4Iy/Jp+KBPB0MCx6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782803446; c=relaxed/simple;
	bh=xbqD0Naz0L0Azlb4k8qH0Z+ErTFix8IoS6j4Nl1cyDw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RH9avHQZt290FOvlF/hhywfG3RgysyZG6FtvGZeSqfJdhbxIpd26IJQKNHM6sco+64Yg8pJBKsnYCmeXGjHVTxHerk68YoWZjHtE9uXb4jszoIVTHOpiD43hKDB4uaVjs1DFYigzJbe+kd4YGh0p+JEG5hBx5L9Z8EyB0OROgqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aVnsTLTN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=cg3aa4P0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aVnsTLTN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="cg3aa4P0"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U6CUTL1090737
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:10:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=vngmKRQr4Wk
	6smvdnu45klUl6Y50rCzQ0BqvywV+SqQ=; b=aVnsTLTNIe5hmC4xtVeCI8Z9+7b
	qY6mgWiVnkcyojjaQqqJmF1jxlsZWoBR+990JneOvb0Q7v+w0zUyl0bpqhBOKF9B
	OR9e64WAcdjg+g7qtw9Qh8JrXv7/Tc30ft+IetF1I1eOT2tCXjF5vxtmUJK5uqyd
	uz1XzAwRtvYPqJlaoGg69XDacdjp5R9eNXVPkk/eLzoLFqzT+uLFUjE4nWi4GIMt
	AUTWqLxxWKLV2AlIFI6RLaF6zrZVof5RGk46eID51dd9yB77RkR7MXwL5e6ep2M6
	c/Rn8l9vqbFNYl/cWn/dYm9gSji6lg1O3JgymmlAgxqM0PRkKeV2SkxGEuQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f45k5rvd4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 07:10:43 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1852a86fso2858471cf.0
        for <devicetree@vger.kernel.org>; Tue, 30 Jun 2026 00:10:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782803443; x=1783408243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vngmKRQr4Wk6smvdnu45klUl6Y50rCzQ0BqvywV+SqQ=;
        b=cg3aa4P0OQ35Od3FIXhhyhyeD88CicVv1h8Bi+gANaTdOibiJeQjWdoUsnyqpNjsLV
         oysR53cNqMVbNGJZSAeYaojRcdGdnCQNq758oTkA0/ioHlJpYON4cXDN20GRw30cgulA
         XuO+Osv7TYGjmiDnOkmUFEQaUJYOcx77ihhptulgO0kQP0tTHjWHB9nwQitI9hbAJ//9
         su2PjesJwupxZCJ7GgjBWGsNGXe2lUucCdkfHMj+782HHig21jiCPJ8OXKQt/bImruc4
         oZ/xh/cKvunYAR9U8xYgNkQFHj0hjR13OBU6REzY2wCGoq4WiOKscfNe5U+VjSbqEefs
         oCOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782803443; x=1783408243;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vngmKRQr4Wk6smvdnu45klUl6Y50rCzQ0BqvywV+SqQ=;
        b=Vk0AAi1SFviM6CVgtK2QRq47OgM5daarmNoHSukDgblqsQ6xGhj4m6KKPaiRKqaYc+
         qn0nnKFm52yznYuF+t/+rhcdgN2zVn9z9sO3YOD4mAToCDOp4esha5c0EyZ952wW3dBH
         PeTLj6Gyc1TEvFIsYRlBGMjbePm5NK36ASD9PY5YYySgdsBoetsZCSBKS385KqZ3Seec
         Gri5ziSSHMHiLKHBTtpJHI8kwF0B2pcNkcK1scxqf3bKsaTzdkVtmD5bm8B67GGZax5O
         4o0ry53D53GcxTgZn/BmQrZ9VlrzS132cCHIhd7pydzfdfLSwkwuD46Loqh58VUVvp6u
         gcmg==
X-Forwarded-Encrypted: i=1; AFNElJ/iBh39OnvN8JnRMR3evBqcwL6V/BWB9342YttCpFiGwF0zJvRtERt2/F12RQRH61MThU0OwDqSsFLO@vger.kernel.org
X-Gm-Message-State: AOJu0YxNicHrsmdDrrObgN/WaY3UEYVKKxBGOje1KH/y/0MnqJIhiKRT
	CYtbxZnN8Hk5CLOIBg8ir1ZUp3qCY4uKARdRfJrEOnZEVPL1DrrvvvcjsSUN9KudG6OrboH1WcM
	ByupiuN4TzJ3JM1Q02kVRhXEYWCGP2XBgYDwJN4WS/KvDsc3Q6PUjhQys4vwNnV4D
X-Gm-Gg: AfdE7clkQhCYpa0GGqGPHEYQXmBh5NNLOch19jD4MGODy9JKWh39J58bw0iSa7KXjgm
	0DXZwvXENOESt5dC7dXzSvRiPgM8FALNRnIMuIWqQFrQ3wC0JxL72ZdZpfExfugbpniN7k4JC1w
	bJJuo8Snfxw5L23Nxb+V5Q7VZI/OiiM5lfiCBzD2PAkw5jZfXVWdp3vIEM5BimRkR/CbkfzQCF7
	dE8FnB7S/yvjSe3TtRz2/LyYHOdGjGVyunHJBNEBj44zj60+GOE9XMyV0Bq3GwVF6t/NWf9e14I
	p4KoSkJhyZBD7nu8aUnCJiQF5yoIm3aSHCAb2m9wjQM8IlsxOR53OqIDSWbf8oeQutV01mPI5hs
	Y42bRks33P77QSVX2sAZXuUbgmzD+5ItfFDrJJaGd/j074O4NsJ4Pf81hViWXhZsr5pSE4Q==
X-Received: by 2002:ac8:7f4b:0:b0:517:307:4f1f with SMTP id d75a77b69052e-51c1086314amr32942721cf.44.1782803442997;
        Tue, 30 Jun 2026 00:10:42 -0700 (PDT)
X-Received: by 2002:ac8:7f4b:0:b0:517:307:4f1f with SMTP id d75a77b69052e-51c1086314amr32942351cf.44.1782803442523;
        Tue, 30 Jun 2026 00:10:42 -0700 (PDT)
Received: from YUANJIEY2.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f19f770c41sm17471956d6.0.2026.06.30.00.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 00:10:42 -0700 (PDT)
From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, yuanjie.yang@oss.qualcomm.com,
        tingwei.zhang@oss.qualcomm.com
Subject: [PATCH 1/2] dt-bindings: arm: qcom: Document HAMOA-IOT-COME board
Date: Tue, 30 Jun 2026 15:10:11 +0800
Message-ID: <20260630071022.3256-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
References: <20260630071022.3256-1-yuanjie.yang@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=AqDeGu9P c=1 sm=1 tr=0 ts=6a436bf3 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=yCt0HePyoOPDUj6clFAA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: JbWPYkcjTJWL89VJkSvFRzZWGFsmEM7D
X-Proofpoint-ORIG-GUID: JbWPYkcjTJWL89VJkSvFRzZWGFsmEM7D
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDA2MCBTYWx0ZWRfXzyiK9ljS6n3i
 J+ruvb33IwECF5kmXpbfiDc6/udIcFjvBM/zgclXhmTwv8iLYMutY9lEl+uDD3wQiFNlUH3QNoQ
 fq/dVyzV/rK6oP9uhFeZs6Krx5xfoGHvWOOxeFnD5nQOJg5bubEcBMScncyp3E5grhdnCeUE/sm
 0ImfOIxW4CrsgmLYUxG0SA+mXKEXFUyl7FUBc+t7VC6Z8SOskndSo957F0wwUhh8j2/OPaprFP5
 nj+3X3NMNwMLln73G151MQ207z6fqMvdVycGXjplQfkCgBEpgk3so98A6snkpXVqmulSP2WIG8t
 tO5VWzSUS5yV6uaS6peH82p/tG1/67CX/FAahPZp09QEhKjQdI2e8X7+zLHm6ZxjFoR1si3yNdS
 oW5Dl6tiuPs+F2OUwIErK4hkpS8NNlUqMocsr0CYw7IPWeUGqVOU6QHUNBR9SWe2VLhdPPYznxu
 NdHuGsZrQAt/gJAzVCg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDA2MCBTYWx0ZWRfX83pm3Pzy97YL
 4YufTabFYC/AIKAqTDMS79LCofnHbb3ihujmxSfctggmVF9Vfu5GSJ7Eq82g+kWDtJqbS8T6fig
 Vo6dm5DIR8oDwUmgbDSyixjZ4fLAKpw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_02,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 impostorscore=0 suspectscore=0 spamscore=0 phishscore=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300060

Document the device tree binding for the HAMOA-IOT-COME board, which uses
the Qualcomm X1E80100 SoC.

The system consists of a SoM mounted on a carrier board. The HAMOA-IOT-COME
SoM integrates the core system, including a SiP that contains the SoC and
related components.

Hierarchy:

    Carrier Board
        -> SoM
            -> SiP
                -> SoC

The SiP on the HAMOA-IOT-COME SoM is equivalent to the HAMOA-IOT-EVK SoM.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 50cc18a6ec5e..a487b9e8dfb9 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -1172,6 +1172,7 @@ properties:
 
       - items:
           - enum:
+              - qcom,hamoa-iot-come
               - qcom,hamoa-iot-evk
           - const: qcom,hamoa-iot-som
           - const: qcom,x1e80100
-- 
2.43.0

