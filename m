Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792428390;
	b=jEJ8Oon8gxEvulb7UP6Bio4OjIE91b/g7il/g5IHi64LnECNNI2K4ICAYV2zEJJQFvyl
	 a3gxH/2IYXO9XeNjUnmtLVUaT0Spm03uBI0byEb0dTjTcFHwnFw1JaA4Ez+3R7bXe7QTs
	 uQt1cD+obqVr0qGm+L6xA4WBLzJPpxChoEK8P/aljqoUg9syImwNkW70njxgu0FXyPR9t
	 ygaNbzB51BV2mW3EpX7fy9CUgErfSYO2VVD13yP1BV2CRslnb3yHrQoPiO29nXBQy07NF
	 5vtcGnn2Oe8X4IrZEoRuWTGybAmc5h19aloEJW6x1qXzrKnklEVQNGRDqT+yM3aQWIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792428390;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GqVTY9rBKUDyN5EQJGDnErCAW0s434OuIjhtvd+CkA8=;
	b=GekIiO73YnDjrPF44iSzSgxEcbym1jo7OpCMLdFp42xa+ov121AhnXJq/CF+A1LGTPXz
	 gKHx2jU2jHY48lw5P0EE07uAcYlwzIadvGDcCU4ck2uNdZx+VLrwLX3ZfMLIs74Bubjzo
	 5WgYWN4BDWCgLkutlx+ren+bSRMwnmKNk1eXPrX9EqJ/GZAga2vGbUGBSwiwCGocr2qtV
	 p5uy3Wyj0TLPGeMTSdIKFWXuiTb3Twlgxv1LsQ3FeX9ijD2+6OvH9ff+NDDOwPdVD9EdL
	 Py9/cZAJ9f7ixkbDseqAq9YAEhJKp0Q7/F9Is6EMlmsWv4X1yNR+ksfoCMhvKOvymdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OHblxKLu;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YG8G0qC9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BC7606A335
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02BC7606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OHblxKLu;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YG8G0qC9
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFOsr02268925
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:46:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GqVTY9rBKUDyN5EQJGDnErCAW0s434OuIjhtvd+CkA8=; b=OHblxKLuoJZiKego
	b6u5LdtXg2slRe2xQKarFPnSxTXwXz9egl0tAR3lI+Gx3B445FqzUg7RvGZAGNOA
	pD0ScUHX+HVhIl9/qD9WHfK/z2UDfSqAn0I7R099U8At9TCdpLixL/KmHhfTqq7e
	LL3N4/90aA9WnIwiJe+PThZky/M+DQ2X8X1ImD2RrIVdqmjse6JvBmoDdDBNQmqE
	olCEe0aQ1x9hscjd3TItsdGS3uJUjHvrlW5KKJL6v6PcSnABceKCaQ+P1FDnubHq
	pfvVwYIRYNBmGdsdqcdvgCfb/yDM2rqdyYbvoTBi2TG6/0srXaloooRJhSzopW01
	8w3hLw==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf4rj7ty-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 16:46:29 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-151ba226e1bso3680348c88.0
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792428389; x=1793033189; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GqVTY9rBKUDyN5EQJGDnErCAW0s434OuIjhtvd+CkA8=;
        b=YG8G0qC9DwZDSEvhCEKFe8Ne/5i1RWpow/o4gHr0D7O7ItNkbo+MOTs6mbWIsCFngB
         aXQqvt0rbWM83YKhNQ+pNIhk42Xd++x+P79dsOLr08CrwTBu/Bzl7PjeSnfbvFivmd8o
         EjquD/YczqIrfd5ntHjIbHySxBNoZ8fri073KnRUevBnnaa2kB+EzgA7ZfRlc0dDBCv6
         bKHKizx5l+5hnu4HmUwNMbJ29AL0Y0I+wxu3j23KtppTPkeXT+Jt7GiflU08tLg/XkbK
         ulSsA/svrh32i3yl4CMccCahU6yhnSMwwBVelzBpN1TrO3yxf5ncR1WgBQIKMdqgSg6n
         Z6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428389; x=1793033189;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqVTY9rBKUDyN5EQJGDnErCAW0s434OuIjhtvd+CkA8=;
        b=prWVLl0irzW2tB3qhJVKCL7kxErznHcowFbsXPuKgivGj7RLzLyDGr1oB6FIe/XPXd
         ie7TrpxC1Y8dUZq4fFht478rSSqLU2axixblYoMr6271cUBHCAi4LVGlVerS8cOtXxsW
         IdS45oXOpX5oD2m7otc7uAObFbjQRAATxIVR5J9eOrT+UVh2Ivf+JJ0Z6xu3zsieYf5H
         Prtd+BUgc8Cg/XZIihmXVLIrU0g7uJ16ctCkR3F2h3Us0w589rmgWqVSHIaqgUPB+rsu
         NraoV0JkOOJh23tJh/20vlWpjj/lV2JI9CmRjbGukwALNOxl3L4MyNsODnWFHlH5SrJN
         rxPg==
X-Gm-Message-State: AFq9FYIjvxoKsQfp9bGdLXb0IKpPlmfbfh6nxAVUZW7jRzcYjGxuRWWe
	GUmV6YvTGTrYFRRL08mAKrrZM3915VzhYr8ukRFtiViy3INjFeAPbHnyNYIUaH7l+fvDuRDbgZR
	yWiBWyp0+zKf0D8T9uRArtkTnwLCsTjC9iiDDj405zY/0qyBMxvhSTABS4ilw8XSK
X-Gm-Gg: AYBFou0KoD2USSG6hPq3LIlx8yQaw2uVQaZM990DIKYaauA9buaNln4iu4EE2WWx8NU
	jujQCl+Lb6j3J/9pVMbfQhEWjYaCMkQhJ9jgAqidYJjmjpDYV9N/VWPwpK/RnYC6mlpPaO4jZMA
	IhAoD16uV6Jlx6BnQTyMs03pOU7VM6wOFHsEf8Xlo9JNAqV7kZzRS4VV4oLT5aFhbO0QO+qYl+t
	cwCdJt+F8W0yDzp7Gs3gtg8EnqZu2Tu2VW684TvpeDLHmrn3I3wi4b/TzIB+WnlzIwQ0PGfAtdg
	Y49ExVjQCwtQk+73J+N8n1afVW116L4rYmRSQHjGz4HBwmYq/dC2d3gA/jjlQa6p8ctoUiiZ1wQ
	ubQ7+VwLqTr1DdJoxZ6u7iKJoQ31PP1Z/jHRyuY8PaTO7+hE5Jd71Htx0Y/CK8xwqbGpaJl/lxl
	aPDEgeKyIV0B/R0ZfFQGdHhnS6iEvcUn4vYmc=
X-Received: by 2002:a05:701b:290b:b0:158:7ea9:4a5c with SMTP id a92af1059eb24-185143509a6mr11591216c88.27.1792428388393;
        Mon, 19 Oct 2026 09:46:28 -0700 (PDT)
X-Received: by 2002:a05:701b:290b:b0:158:7ea9:4a5c with SMTP id a92af1059eb24-185143509a6mr11591181c88.27.1792428387663;
        Mon, 19 Oct 2026 09:46:27 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-18314b16f57sm30379415c88.2.2026.10.19.09.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 09:46:26 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 22:16:16 +0530
Subject: [PATCH v3 1/3] dt-bindings: sram: Document IMEM found in
 Qualcomm's IPQ9574 and IPQ5332
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
Message-Id: <20261019-imem_restart_reason-v3-1-e6b1ff5de841@oss.qualcomm.com>
References: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
In-Reply-To: <20261019-imem_restart_reason-v3-0-e6b1ff5de841@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Proofpoint-ORIG-GUID: OFin0epmP1So7JXdbw6wAmbByyRdk0gd
X-Proofpoint-GUID: OFin0epmP1So7JXdbw6wAmbByyRdk0gd
X-Authority-Analysis: v=2.4 cv=H7NOUOYi c=1 sm=1 tr=0 ts=6ad64965 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zedVYrxwO3aBKnPp0vMA:9 a=QEXdDO2ut3YA:10
 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfXzWBSISvaxonA
 VtZxmsQorYnEwbYV4m14X+JUSuIW/SdopSxU/RUtpXRo4GiRYK8X7w9GBRmH5ciaz0mAizXHm5z
 k99IAc3QiOz5oVdZZvfE75WfPIpYMPrYUr5GPoYXzilztg1ImrSH5BNakn9GCjeAiCkUCvdrq7r
 QeUrT+Qdx8Mm2qFF2ozwGh6rFesfkxK2v7CJE1Bci3xr2Je1eHmRNRhR4f5HDoAzyhhbBICnGIx
 9IO9yQcfdFc9lMAtZ/kZ9b+P1fEOlSwWw3y6H+exRyWwSF3FFNFRnLuDLWKGk+ACquztv2ZIddV
 Iaz71R/ot9ehUifdI6nB6o082XGJ2KDjie2XtwqcVbSUQ1Q9kpK/JByHuZ841mbjcexaWKcVrKx
 gSF9kbu3lXzrC0xS62kjRVu3cjfb1loXTLuWLxC+XshurQ/uwCv1lyCgEttsCgsK7hr/83/0ou4
 eJXSE8QRKzcP0hAX/Eg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX0Gq2G7P7aieT
 FDEIHaxYT1DFqTlpXqWsb3bnOdEMoq46Hq4By21e+kD9oJSqq1qNbM01ZJYMFRrDA608KDmXI3z
 c4fp2sGf6q1kvGa01mTx2QfitN9umGA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 priorityscore=1501 impostorscore=0
 suspectscore=0 spamscore=0 bulkscore=0 adultscore=0 malwarescore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190066

Document the compatibles for the IMEM found in the Qualcomm's IPQ9574
and IPQ5332 SoCs.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/sram/sram.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/sram/sram.yaml b/Documentation/devicetree/bindings/sram/sram.yaml
index 6ee0b1464722..b09a70b3d576 100644
--- a/Documentation/devicetree/bindings/sram/sram.yaml
+++ b/Documentation/devicetree/bindings/sram/sram.yaml
@@ -37,7 +37,9 @@ properties:
         - qcom,eliza-imem
         - qcom,glymur-imem
         - qcom,hawi-imem
+        - qcom,ipq5332-imem
         - qcom,ipq5424-imem
+        - qcom,ipq9574-imem
         - qcom,kaanapali-imem
         - qcom,maili-imem
         - qcom,milos-imem

-- 
2.34.1

