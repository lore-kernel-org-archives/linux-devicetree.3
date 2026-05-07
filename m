Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18A444CF4F
	for <devicetree@vger.kernel.org>; Thu,  7 May 2026 17:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778173738; cv=none; b=X29SqSelIJUV0Uz3dN6bXYgb2lrDzKfvihgGzTJnE+BoSP+EST+RWBDZWdhPRBkEcDzM7d3DyClQUpH85C+Uuls756C72hW+wat0KlKNKkw9TGYkNCgTVLxnp017bqyoK6kFLqSWgRZ7qnHAO4A/rsWRWBQGFsiIWvz6WawnS1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778173738; c=relaxed/simple;
	bh=AjymDrwSTwOmf+14wlE4sp4uE3esnCFm6QfMo2Rljqo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=D/yhmfseOvcH3j0PIeaRiGVnYylmuS57lzn38avFo+lVLFUn0dwWPlYgEFogdFgyDGmwVXPvdbdqsJkjmw+kBQ6Cmxdx2bc44Zw98yNvRn6sH7Z57e2rQwdPGKOKjtbJjhw1nojTho2IHXjKxYaRA1KPvHqXNR+dB1MWLJQtm8U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=c5D4cKL0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QyqKXgJR; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="c5D4cKL0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QyqKXgJR"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 647G31Vw2384213
	for <devicetree@vger.kernel.org>; Thu, 7 May 2026 17:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vq3mUikISBUWPMEsDJ3y9/npean2U4ruSFjDqwFpI4I=; b=c5D4cKL0hRwkdsXP
	pYTtYVJW18vLeCzo2cbDYEd772/10tGRJEJzYrHna8GYTwGvZzbBGtedH8R2kjqp
	zpOTk+ACYn74kRvTbUUbMhyg4L6pyO7rlSSi11P83FmtGAn86hAHIm5RZbzz1MDA
	Hk53gKF38ap3vIi0wT/NMqSEosHGHDaqmD7Y06VJIzpfjvUhM1JNn8WbP2ZT85uC
	3GxI8suS21x+Ktpxg3oag0yf29qAMEG2abtMhCFOSAOSQXJRq3014LgiZagrVb34
	Er424XLgFWvhaJuz7IIgyAt7/tehj/bYzZNasSOOkMNseLEW69ySryv74vh3fFIh
	erNdlg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e0wwug8nq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 07 May 2026 17:08:55 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ba86e35aa1so16628765ad.1
        for <devicetree@vger.kernel.org>; Thu, 07 May 2026 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778173735; x=1778778535; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vq3mUikISBUWPMEsDJ3y9/npean2U4ruSFjDqwFpI4I=;
        b=QyqKXgJRlsrYHMqnJotNRbgp8U3TdP5yYlACpiTaYM1jpZDoJgbAcC8Fhb79LaFv9P
         3ljdPHnnME+6XeoxBxcNEC18HK+df6S29yI9t8/IiVffNzokmyLtU7XCZAPlylC2gSmN
         7dYjY6VlGRYnJqD2vVuAvLQGWNnn2mbkbwLXZHUpL/xEpoYs61IGkzVMT3/Sr9HyMTRV
         /4jKWFqVOhR9o258wmfFRsgA2ae2ivdImg42kPWL1xYMbJQ/kprmn9fAkqeZMPThU4k/
         ZJ4ZGZLCzq3fmVdZSE6f1fBmKdw0lhd3KjE17bcvTntE6NWFb8n42dDKl2JgiI0BhZ8W
         sTug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778173735; x=1778778535;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vq3mUikISBUWPMEsDJ3y9/npean2U4ruSFjDqwFpI4I=;
        b=LdUNZ8FiExdvZ1MKxqtWPWRwq5yU+h3gikIdyHCmmaQEf7kjknA9NOs3DS1DJb68lZ
         Pheyrl3pdNGjALdHIXLl06gyXubhUCQQBGKST3Z+3MrRn9+vIKSnC/Ji4bbRFaNqv5nl
         97vJAo7emIP5mk8IUA62Pu9PI/IWgWoZuJ9SHRI0TkiX4gkx1S9qW6V5fv05DJ37C7Kn
         Za/SFtCGTizBAGLOeYyVjMmtztGOZWWo5IDEnzlPzqppL7FbqAMMSc+ifEZBZQO9AKRY
         8uuAGOFAtqqSuAuc16rUoxCj4BkbR9Nw1Kry73cVmuxNu2g8kRLfdeVJBJz20KG7/Ndr
         upKg==
X-Forwarded-Encrypted: i=1; AFNElJ+WrL3s5xuzHuMwh/oKSAneB8izo+JCyVYCQhpEzdXg+wJoZiGGQAHOnJ95FHScsXEzmtovhoV69sm3@vger.kernel.org
X-Gm-Message-State: AOJu0YyPOC4VaJOQOf/Cmq1R+Z0f1571ckbMt6eLA0Pgo8843s6LFO3R
	irZdoyl6ZzJKik31GnFJIwtFtAeroHZFiVvp4gP8oTkyn0QnGyZOqVIM3i/Aw/kBvVKsaaH+rJ5
	8nSFK5KnmFm2sd9fNllRqX5VTYSskvVq7bG/IYp8s5MhCH66ghbLTqhqAKCuA+zlS
X-Gm-Gg: AeBDievkFEy3hqp0Dz5guxjHKVkCehfv1DOcEZxdRi9Ozk6Ho7tpbylYfgdUgNpASXk
	HG8vkLtjv40jYK0J30tc99wtzjXYEWfQojg6iUp3k1CGZjAjDL1VwA7rlMRdBPOT6vX87s6U8Mz
	X6tkbAn7AdivRPrr5WxMb6xV9D//kn5NRKF5JZ9uYtZ4BC/MvkQ37GF6GOVnYnMcEaeeQlcmj+v
	nUbcBGvmc9FnNChLtg11wFps2kHwZ7dhFqFFDhyNrWPwQoYF7pb0nPhfbF34JBYZYkTCDY4tc1f
	phvU9i9oFSoeBxFIrsQfsqtqRZCSfWTT9zFGu5HSX0ozMe/GGpgnzVMG774BaKAEaGXpOvonQXg
	J86jzxaPiNaEWIHwVp5g6KhKhtLUr4KMEoGRs9WKh3D32TOvYfsCcEaUA/8qQoszULmznEGHdXJ
	3QxfmT5SplnmJjTeVef1/mHoA4JrLpKfdca+LhagnL/Yux9gdF6c8pBt10
X-Received: by 2002:a17:902:da87:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2ba7a330deamr91688335ad.41.1778173734762;
        Thu, 07 May 2026 10:08:54 -0700 (PDT)
X-Received: by 2002:a17:902:da87:b0:2b0:7531:b61e with SMTP id d9443c01a7336-2ba7a330deamr91687965ad.41.1778173734311;
        Thu, 07 May 2026 10:08:54 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bae78751fesm2530455ad.73.2026.05.07.10.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 10:08:53 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Thu, 07 May 2026 22:38:29 +0530
Subject: [PATCH v3 3/4] dt-bindings: qcom: add IPQ9650 boards
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260507-ipq9650_boot_to_shell-v3-3-62742b49c991@oss.qualcomm.com>
References: <20260507-ipq9650_boot_to_shell-v3-0-62742b49c991@oss.qualcomm.com>
In-Reply-To: <20260507-ipq9650_boot_to_shell-v3-0-62742b49c991@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1778173710; l=894;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=AjymDrwSTwOmf+14wlE4sp4uE3esnCFm6QfMo2Rljqo=;
 b=KAcigkWQwEraOb4AcDg4/E+LrPlXgvdx8UBcATtXbUbzA4vL/7pLonUoEXXSNCrkwheJELs0Q
 0SLs9vrgVF9AA7OcQZ8q7FQR5vArssQ5TJ2QWKZnAfH9ZgWWPalB4Ue
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: myKr3cN0ezo3RXgfQEYGd8yeGQ9PU3ui
X-Authority-Analysis: v=2.4 cv=Nd/WEWD4 c=1 sm=1 tr=0 ts=69fcc727 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=w0Gmm53Jqs2pEdcyGHcA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA3MDE3MiBTYWx0ZWRfX+ls/y/EoWQ2N
 kRPQtgSRmcJhI9lRdrCv67u+qIr0Z0EWcQlHSgsw7QAcSwFrQq5qBLNDmX7iwVY/MVx7q0iP8SR
 BE2DzTSIS/CBbyVAkzDrv4Pj73jj639K/rRwn3EeMyCBaIaMfXxWbghk1K931p2ibcQc/qYlr6Y
 SXqwUBwPOtyesMP5B6DZP3PTGhrMBliLHbvyY4EKPKp2Etel+XNLAKUxWrQ6FZwLyRHKabUJFH0
 AoOk+Be1jxaGUr1zDmDE9Fxf2lRBVGaX1zrPu4G65pbf06O7SggWYwPNk1UWH81cduR7gnyjgbS
 FAgYrywulSZb4xnBqFDMTG/wwngWaG2q63L2DiIXPYTgo69qjWRCfgkSVeeSMoxTEqze9bBGSG/
 H/VXQVgAmmbmzKWOgbEUJ6599XrOq5oQwcmA0UegMn56cQxA4IQ5FzqPStWsyotVljWPKs4v2qN
 VxtzsLYrZUt5cZypJ2Q==
X-Proofpoint-GUID: myKr3cN0ezo3RXgfQEYGd8yeGQ9PU3ui
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-07_02,2026-05-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 phishscore=0 clxscore=1015 spamscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605070172

Document the new IPQ9650 SoC/board device tree bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index b4943123d2e4..5d0855765fdb 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -365,6 +365,11 @@ properties:
               - qcom,ipq9574-ap-al02-c9
           - const: qcom,ipq9574
 
+      - items:
+          - enum:
+              - qcom,ipq9650-rdp488
+          - const: qcom,ipq9650
+
       - items:
           - enum:
               - qcom,kaanapali-mtp

-- 
2.34.1

