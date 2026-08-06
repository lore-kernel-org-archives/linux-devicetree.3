Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325033B895E
	for <devicetree@vger.kernel.org>; Thu,  6 Aug 2026 14:38:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027139; cv=none; b=CAjS8+fwqe6LpyVJGmJT/2AVsqd+WtD05rBAiy2eXS3N3o/hPuPx6gjZnNsqIh41SvUWbYWbRfF4eEJdUo5B7D11rv0EMzFQ6+HF2u+P/if0zApsGg46IuDAUvdYH8AV6us9MylppVDanz5UyGbbstk1qRfI6KjtpG+++ZBwDpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027139; c=relaxed/simple;
	bh=rFLR77CJJYP1sKLFQ6gl8hLWfcBFJvASp2MjESWcdt0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J/5tD/ZvhGc1jIXdDQnjtd173APzTTIzYVm6Luktb/kUwBjPX5n2Tcr1sYpMJRn6NJOmnMMxvoKOLJKeFbpKx11R01CMfmX5zVpxyDusJY7KAm/IDGJ5kvwutlE/lkbUpxs2BxMMzm2kBsxctGBeH2FhRjyFzQsF65YvXweGAyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DY8zLtgk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XvnSSbky; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DY8zLtgk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XvnSSbky"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6769nnHQ2105341
	for <devicetree@vger.kernel.org>; Thu, 6 Aug 2026 14:38:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3Pq53qNpO4Cl13XpVwNXOs8IgmR52etnko+i3TUslYQ=; b=DY8zLtgk6GRUKKXH
	ChvACXmhsf7wRge6WlyJBT7d4hVgvki94RA1N7o53IJ6WoMzYGRCarNMLpYLFwzG
	3nDXtEuYF3/p0zimY+tOUUM5+tN0nYnD3xU5yZ/JKpuk36jd8krQwo64bxdmJ3G1
	jPbL5DM0gz+L6MfwAQZpZwkHrjMzuTadkrWryDvyz/EPmH0GgWwxAcPX05E6xxTb
	9WvNdUp0TG0BznJspN/B7I+G+o3oGERTHb06nLVFrBuew8It9V3CJslxKhYZK1ec
	EzgD7VRnZwvDo51yH8+rP0bFF+mHqxw/xrDqg4XrzMAFpH0odyAqNQ6WaP3UVRl2
	PxMeCw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvq731kmd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 14:38:52 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5174a236220so21688651cf.3
        for <devicetree@vger.kernel.org>; Thu, 06 Aug 2026 07:38:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786027131; x=1786631931; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3Pq53qNpO4Cl13XpVwNXOs8IgmR52etnko+i3TUslYQ=;
        b=XvnSSbkyxTgDhDK+fNRpObMIj3SpwUup9R7f+vFHVWNJ+3sWFkaiE+sdANmnJcilxF
         6UyJ2aDubqeuRPvxSpW0QUkuJ++lq1Fz5t9nzlm2X+P15XqXAYFHyZ3iTKVr+OP73Fcj
         erRuaiAD4Wt/Gp385go7ELw+YDOhhAzU4ImVMepgV2O9qPbbZu4l85aAELuVT5NUMedw
         35dyboP2gWa2M/CtOSBu5GpZmv3La0ochTQDYE6Ch9yqsWDFuGa7l4tcWZFd0epIPTcO
         /dS1JZj8tMKKw3ILA0byxPy04PecexQBLpBUJGG00Mh4CRRgrf45mbanbqnL7tANhxT/
         j6VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786027131; x=1786631931;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3Pq53qNpO4Cl13XpVwNXOs8IgmR52etnko+i3TUslYQ=;
        b=E+SvNtOvlymfjALvH1LkfrDaOMok2BxVd385XWmSQhu6DFrCQajx67R3Pzy2YhIiki
         +AJS3WFgK9E2R26LWUlXBobhlKKkBir7EGnX37XyJQOaJqGsZXxPMaxv/TagcpF3ifzp
         I7qkZc1uYs1P7jVB6Jn1kNntsHbWkzYy+hZ3anfxwKNHZbNBm0U/dpxQWV4cltV1uyoe
         0ZA1BOQjSINAoNS29V+k2NRg1PAVeUI6FLzhtVt19MZDGYB169cg7Tc22Jjjq7OS+qBP
         +HUMhclT2ma6Fgy8kiJenuBCtpljOw3PwxK3oGwO4n3SGPRaEXYtn/eZDgzWo9QW4W35
         qzmg==
X-Forwarded-Encrypted: i=1; AHgh+RoW/tg1QxzEK0yjiGgk+cmMzBpdVpy0h02MQcxR15vTVDqR6ej+QjcFjLfUiqcfEA8HCF2NSEUuWA7p@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8bUqeXHBGkNKNkK+NfhaeDV9CevUXiozlAlgF5oki6X3VGsIX
	lI8Ats3qKOmVOOv5R6LITa0dFHUdAgtvm3YfzvlRMnK7pmjul2j6Enla8yUwEcgARhDpYsvnt38
	se8c/AUPMobo40Xe/85PcefWYLF+xVZyl2hCPRSLFKwcF9lLUm+kwe7dy3AZAc0Al
X-Gm-Gg: AR+sD11AKltkzn1j/nbM+5OToE+Ot8kdMSL8m4HRKp7T2mPIE3B/BgdNUfbuvOl9zj0
	dnZXO1769U4HqtVmaDO72gW8i6POi/500WMZzTyOp3QHktX37CqRTXMOPHUinLz0lNQFQvLa5kq
	MhcPPQkhzDDihjqzfPjkBa8CRifw2L+hieuoT5Z54P0m9i9luaX9nKWMYYFBAlU0cZcoLMODup4
	R//i2oQnrCVdnaS9BaCq+SjHTTOBELuR2FiHvyH0cwcIw6lQOJymV2OYLLyUSTgeihTOMkaEEWL
	0WaRpALHKQErMd/Zr+txuDhRKYn631NNautnv6v7Vu6E7ugHJk/QN9VXikpIvou+IBowLc2YHdU
	OiS2RWfZRFc+cue09O0v8Y+HahtVUMZDu39cyfjzOVdqAQJ5VJxFDDnbk7upYHaVvgtnCrOUses
	glyhBKLm/YqFnMD1msirXRQ+i0IDlpbcs8WaGcnOJqbJ1brdzlsw==
X-Received: by 2002:a05:622a:1447:b0:527:43a:2f30 with SMTP id d75a77b69052e-52ce5f6013emr149751481cf.1.1786027131412;
        Thu, 06 Aug 2026 07:38:51 -0700 (PDT)
X-Received: by 2002:a05:622a:1447:b0:527:43a:2f30 with SMTP id d75a77b69052e-52ce5f6013emr149750561cf.1.1786027130781;
        Thu, 06 Aug 2026 07:38:50 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([90.85.108.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2036276e58sm270552166b.28.2026.08.06.07.38.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 07:38:50 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 06 Aug 2026 16:38:35 +0200
Subject: [PATCH v10 02/10] dt-bindings: net: wireless: qcom,ath10k:
 Document NVMEM cells
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-block-as-nvmem-v10-2-be598b2a5606@oss.qualcomm.com>
References: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
In-Reply-To: <20260806-block-as-nvmem-v10-0-be598b2a5606@oss.qualcomm.com>
To: Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Jens Axboe <axboe@kernel.dk>,
        Johannes Berg <johannes@sipsolutions.net>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Marcel Holtmann <marcel@holtmann.org>,
        Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
        Balakrishna Godavarthi <quic_bgodavar@quicinc.com>,
        Rocky Liao <quic_rjliao@quicinc.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>, Andrew Lunn <andrew@lunn.ch>,
        Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King <linux@armlinux.org.uk>,
        Saravana Kannan <saravanak@kernel.org>,
        Christian Marangi <ansuelsmth@gmail.com>
Cc: linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-block@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath10k@lists.infradead.org, linux-bluetooth@vger.kernel.org,
        netdev@vger.kernel.org, daniel@makrotopia.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX/u37aYff088h
 +9oHWTTMcP+Bp9CsNm9I1tD+w2gx7Qahb618m7J4Wpss/q6EGKkJmhvQYgBMKucj5j/g5y7ss5w
 BOjxYzdcUc2xI2mGkCb7SNNqhR8sRlli3VQHDq0OXFma+2IZD45T14A4rwZ98jdhCQIInPcsgEw
 yz6WG/t1cKqm8cHltp36AxRFv/rnUdZe4nE8EejTwNacKefdmCDFymA28yJTCNp27Xa3b/aOBs4
 gx5Yx1mt2oM9pBXbPbKvZBgAtnbOJ3Wzd0JfpCJT+yJpn6p4TlhfawMcc7aStmOf0Ul+tZpdwmX
 eICeIi0v9SkdasMlY9718Rk6TuDxIBleYElGdp0PPvT9Xllod6f3LOekNucF/0t3pObccYMieC+
 sR8H+5dIS2DBt7EJqmHYqx35yh4z0Sw1L67j3LI/Tl3RwuhXvuPR6yh8mwKNXZxDChdrAOdUHLJ
 4qrBv/NDAlDYHDioBHw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA2MDExNCBTYWx0ZWRfX33SoJn2xkgBZ
 lLyqfXCMSmuQd7PQviPqNcO8bqj3n4KseH5nEaw9gCSfx8OWgjZ6TcgF9jnaGRnr/BrfmwqyruX
 kvWVZqFjfxuGZyvnZmvwGcldiHErVCc=
X-Authority-Analysis: v=2.4 cv=EeH4hvmC c=1 sm=1 tr=0 ts=6a749c7c cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=JDRa4Jy4r6/BpSpxP2cCow==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=Xy7nGJaRzBGhkMsTZAMA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: As4XcZo7VPWxCLqndphIzY1MSdtR2tBI
X-Proofpoint-GUID: As4XcZo7VPWxCLqndphIzY1MSdtR2tBI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-05_06,2026-08-05_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 suspectscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 spamscore=0 bulkscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608060114

Document the NVMEM cells supported by the ath10k driver, the
mac-address, pre-calibration data, and calibration data.

Since such data may also originate from chipset OTP or be supplied
via other device tree structures. All of these cells are optional
and can be provided independently, in any combination.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 .../devicetree/bindings/net/wireless/qcom,ath10k.yaml    | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
index d4f4d72ee0d388f43437fc5a3047f90b464a5274..7f9d16cb7c14330e11ce7d567d585b5e47793bd8 100644
--- a/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
+++ b/Documentation/devicetree/bindings/net/wireless/qcom,ath10k.yaml
@@ -92,6 +92,22 @@ properties:
 
   ieee80211-freq-limit: true
 
+  nvmem-cells:
+    minItems: 1
+    maxItems: 3
+    description:
+      References to nvmem cells for MAC address and/or calibration data.
+      Supported cell names are mac-address, calibration, and pre-calibration.
+
+  nvmem-cell-names:
+    minItems: 1
+    maxItems: 3
+    items:
+      enum:
+        - mac-address
+        - calibration
+        - pre-calibration
+
   qcom,calibration-data:
     $ref: /schemas/types.yaml#/definitions/uint8-array
     description:

-- 
2.34.1

