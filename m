Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793452274;
	b=nzvWBmlPMR6LIGlukBpi1fqeJcnYIHrHgDH4KmapRDK/e4Ai6CaRZdEZ3/XfE4RKgire
	 tDDhNBkf2jBcr+PDLGHM02EBWwVPeXBnyn+tA84LtIYJ9/9U0BaUtVEL7K6A7qNZhdzR3
	 RAOuemDygR/LGcbDv36zmt3U84xJFv057SsUP4vWlVtAmBOsgmpIDW8X0/PRQcm1eMdVy
	 jpOSqQW63HEetPfCUtvGpHbd9MNO3WqiFE2B8A5GalImrSHpfPqAIn7YjTZP+m+20tZD1
	 IUrzjlL6HLDlPS90F7TXku/ai948rb7qM5Pnlset8GGdNeoIxPaHPQTg+TIMKgdod8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793452274;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ZjowRiis49WC5hZioqYWlZTiLLrFCHYTqCaAy9Vq52c=;
	b=nx8xH+GHY4iIrsL3osy/HDqo67fceXIlLFNCc3tGhqZKgAm7jEtPwJ+sbC/D5pDF14SX
	 yosUrG6D0mYC+qdPGD/i8eyBMkHeaGg6PjAsiT1fRn7Wv9d9kCrZRy894TAE+8YpNtehO
	 zfjY09V5SAHsFTIxHbo+xpFQMPGCr3XZYdZWcdqvumDZDfOg5BAt5e89n2btT3OmoJmPO
	 8WU3Q6V8RwilpGj/qYI80lIHjMa0G9z9+6bSchPl2RTNOixcB8YKM+wYutsxvu0PnC2uZ
	 WSU202/0l9XX07JRyzwh3th1ogey2ZN/X8YyNPyor/7p8E80ENjsYZPMVaphUSQCNtA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2IlnkNz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XkyLmp68;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAEE60A2600
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBAEE60A2600
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Z2IlnkNz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XkyLmp68
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69VD0b7t1632299
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:11:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=ZjowRiis49W
	C5hZioqYWlZTiLLrFCHYTqCaAy9Vq52c=; b=Z2IlnkNz5nTuRqCewm1uBBSYzmE
	ly1nW0Hc9e4X7U+W/Gk7hKrvV0m2Tb1Rpbuhzvjw2GJdUHGteLuODn34YWjJdyF1
	sWeaMfFonqa6yC2smjJxH3C80oQSak9Jl3eRSG3J9dl31KRZUAx4lCJZ1wed5tiJ
	bUJrfw9dOnb1Eiv5v8l/6dLY+sLG5TkRh1b7xpQc57GQYlN3RZoUsD2ASGu1agAc
	91jAv6sNlFIFOOMm1UaWXxsXG+S7MMFurv3lQ/hwSBh32/t1EnMqN/fFAUkCWkaZ
	h9XHB6EllVixualzlxDQKs5e2yd/Hh2p4Fbs0TSmXesTVFjnaK+tsUNa/mA==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn93eh1s4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 13:11:13 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-139b62317d0so1792348c88.0
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 06:11:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793452272; x=1794057072; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZjowRiis49WC5hZioqYWlZTiLLrFCHYTqCaAy9Vq52c=;
        b=XkyLmp68UErskm9MQXgNBZWctPGstP9uaTKwwfl1qac0Mp9Pn4jYhfGu98Oox5s0jG
         AhMd+1eT+YRrKPhA0q9soXa0CuSSowT2ryGmYqOx7vzP0yn1+wug+EVIjxiV7qWoN2i1
         eUk0dFha7DBU5hq96DItbz2+hOK4DN/2gNfYJIHj9tnaE6BSMvccj6z8fYiFDlIDq6MR
         YNpDkaD1/jN7i1F8fwXiFdF8AyCpkIIyZw2R2TWOMCHZ2odJuCEu4TdZygR6NKj8n19+
         KJKmkyx+95ZAYBp9B6D01wv0ce3oCJsSeHbV5w9k8cnwiLJRMHgSB4P0eDh28MEAoHZE
         nyvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793452272; x=1794057072;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZjowRiis49WC5hZioqYWlZTiLLrFCHYTqCaAy9Vq52c=;
        b=C847J9dtKbSbM3k+T3LHxiJys1aH5Y+xkBWJG0OX/9MTrUB8p3bJltkcRLUJfQwIdI
         zYIlpCoSbTTHZ9L8pcITDo+U+vykxxo0uGGAoBFsuZwxvkXNT52NADLgzwSukzFF2MDN
         Xc7ll0NAOl9t6BiEVBZQZFxnaxiVem3qLEVPyCbbAH/u2OJ/HnuGIXvT5G58xI+ySe13
         lLQGw9R7ZsD18M4fbvC/wP8XcLnPZSIRto2o3jZHjbQysKLoTd2qsSqz8QkDZekhuWuJ
         SwKAkunXSepIPBHs6D6LpXt6r6p1I6xbzTKCJEJOZ8V8XDOOxBNeI1ebUSecvKilq2n2
         rJuQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMNXiVjzNrX7EnkDgexv9F9k1/FdgZvGU+S3o57yKOvo6SA9NoxnY0lK3cgJpeTSJwwTKTgOGuah0S@vger.kernel.org
X-Gm-Message-State: AFq9FYLb9FOWFSPsFWF9vWFPczTmxdPbqDoeOfg+Ls61RT65q1N1ymMX
	AezQYZQgv0G7pjX+MTVR6Csk1SvXvwQ0jjcCAlbJVlvdc9lI4kSH2s+SRI2mnIpNvBoOyNHCAfX
	gKiJscIBSN9srlkwnEENG35ZXJjv7c5/hZNjTlOAbn/J69m8aXK9S8rC24HrFu/Vb
X-Gm-Gg: AYBFou3TFRlofOERFrlglhsPyKR6OUIIUr1sXiXXr+MeyGzi03gohgvDbx7tb4Uhu3q
	mXOhQ9IWnVFp1Q0nnYRnta1DWcrmdiIcnn6VUv3xsyFoFpJ0Hxty5jw9P/hgvi2eSPElyF/Sa9+
	g8lvc3tnk5r1N36M4ZmQDHpWcRGm4i5PDrFCvhewt43GGMAIbR2dLLg6Czm3Za14jS0ZtAVKSmq
	5X5zYly6QqTwjC/dqxZK0wO6EysyqNl1DFdEobKISy3JfyX/106Sepw2TvFB1ZDeudAcNI50Wx4
	lyiiiQyFnGkmWJvZaM3PDg4VbPpGDk270wtCQM+zUA+xA9Cp+LdfdCdgG6h5JjEy0WonUcVvUeN
	F6TbLkD+l6gvAasE1QONPoP1074g04CPPJ8eTnociRWacJugmsF5jH0ezE1+5ihgugZLZcSzuDD
	IHcwg+0l/DiwGvDKltBMjNnB9QLwZGnnSj
X-Received: by 2002:a05:701b:4519:20b0:17b:fea8:1425 with SMTP id a92af1059eb24-1ac5da753f6mr6938503c88.30.1793452272389;
        Sat, 31 Oct 2026 06:11:12 -0700 (PDT)
X-Received: by 2002:a05:701b:4519:20b0:17b:fea8:1425 with SMTP id a92af1059eb24-1ac5da753f6mr6938476c88.30.1793452271906;
        Sat, 31 Oct 2026 06:11:11 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac1845817csm15717872c88.5.2026.10.31.06.11.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 06:11:11 -0700 (PDT)
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <brgl@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>
Subject: [PATCH v3 5/6] dt-bindings: arm: qcom: add SA8255p Ride board
Date: Sat, 31 Oct 2026 21:10:41 +0800
Message-ID: <20261031131042.1200862-6-shengchao.guo@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
References: <20261031131042.1200862-1-shengchao.guo@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX/fXrQDyYuAMP
 2XGX5/x05+3kmRTxoD74rBBHs+6+vMBtT92zygEg72M10f5r/2SzyW5S29taKLA57Lv0XBM2wnZ
 euwuQ3Osv5mwDvEFTEAF3jncdfWpOnV87HfWLDlnmchE6H/K8YzPQm/F/hFoIdEGODzz31Sf7YF
 PeKBNQS9vgFofx3f7Xk9T3Dvlysf2LDn8VvdYWhBVSB9XOdGRWn2oQK9C8bWAhu8CM/amI+vp+F
 aHCsa7xiMdoQm6n4dQQ/08ITEIkNtEA6JYVw5GK4ql/phE9a/PHwGSIAhq6RMUp4CW1etEU1zNA
 t1WjJJMn3hS91vgF6uErt4ilKFS51mx/KjoJOztG3JQzcuWyNf1mrl2y6mPSOtZsEpnHgIevFBy
 HLAPjeD8VsdsjQxoiHID65dAbBoRJ0onS8fgdbldvlnsGZVbVMMw/hVE7gUGCqhmBTTuF/yxAiB
 RsLoL293INl8T/fVbdg==
X-Authority-Analysis: v=2.4 cv=FciiV5+6 c=1 sm=1 tr=0 ts=6ae5e8f1 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=COk6AnOGAAAA:8
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=uytbUiI1na4GE1GmpowA:9
 a=Kq8ClHjjuc5pcCNDwlU0:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: V0DYapGILx7YiojLaPab1XJ-s1jaD4vq
X-Proofpoint-GUID: V0DYapGILx7YiojLaPab1XJ-s1jaD4vq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA1MiBTYWx0ZWRfX9gQLZ7ga+QEz
 7BuNaGxhE4M3Z5T+QzzqsfQWaj2XoSF9rHsUUZFb/deu5U1gNdyqflusAGFkR5j0snO/m78Nwxm
 VAyald4nrwEeNTxBm27ZDa6suBeYKbg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310052

From: Nikunj Kela <quic_nkela@quicinc.com>

Document the SA8255p SoC and its reference board: sa8255p-ride.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Tested-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/arm/qcom.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
index 121ca557ce1e..415567b085db 100644
--- a/Documentation/devicetree/bindings/arm/qcom.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom.yaml
@@ -490,6 +490,11 @@ properties:
               - qcom,sa8155p-adp
           - const: qcom,sa8155p
 
+      - items:
+          - enum:
+              - qcom,sa8255p-ride
+          - const: qcom,sa8255p
+
       - items:
           - enum:
               - qcom,sa8295p-adp
-- 
2.43.0

