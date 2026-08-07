Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 002614252BB
	for <devicetree@vger.kernel.org>; Fri,  7 Aug 2026 08:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091142; cv=none; b=dDvLKA4g9Lpq+1iqowITO/TaUMYgSySHiEqZJsrXbD82TzKT1GQDNRl8SFJWwoQZZzC51co0tTX8Iolxm3eMAowi5lR6Sag2lS3owGO7IxhQK3gv8mQ8esh5gjAVGwl1IhU+e8UwJkp94dBxNXZK0yTlsOLLuWHZPiDRQTeuq1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091142; c=relaxed/simple;
	bh=BwrkrLsH1U6pF8sgcZ6o579AfE/d71IHNQRMfwrAtyA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=scG0/nCDDoOw8BamE0nAIQQg8S3hE+Lm5wrNOs0Gbli02c30Pr/rEQ7EjgRgo5Vb6lhMuEoNQUBtPeWYheR0hu1RWarv0oQt9tpSE3kudWMtGWTvgApSMTpmKfC8oOqaUpzYSxSX514FKI+mIi/ws9FOe/8yQoHIzjzhNsvvurY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hitv43Fh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i2uMV3oW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hitv43Fh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i2uMV3oW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777Lb9o3176986
	for <devicetree@vger.kernel.org>; Fri, 7 Aug 2026 08:25:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nmACaop3NpP/tkQpdGI9o6oXEIytD3NJ1p1fSFW/3f0=; b=hitv43FhHtCehEGE
	Oa9hpGc1WezIPAIXNIwEpmR569M6Pqd71wa9Xkn6T5dddRD0ot8ocCf+j/P8Mw0+
	VUdcASYRCr50pK+bAcCriJbJAY1DDs8j1Yt25/MsEW1qmwdcT5yp6kjjlHLQsikP
	GTKb4Lk4tHnsVlQEGvFGsS6YRgMA+C3ZDYjmqs13BSgWajmEX8w2t0jvrDkM25pV
	MJjTqpl7BlFiyR+ep5eGv04Dbh9MPaAuf5jig477xSLgpVeZAskt759PptVRIMQ/
	giIQdjhugYFh4XJimvg1NLT9kuLbUmU1HY8HyxF1xuMEb3wqtG5kxzUrj2ZsEHQ0
	fSW43g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6jjxn2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 08:25:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-38e7b87ce77so3811363a91.0
        for <devicetree@vger.kernel.org>; Fri, 07 Aug 2026 01:25:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091139; x=1786695939; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nmACaop3NpP/tkQpdGI9o6oXEIytD3NJ1p1fSFW/3f0=;
        b=i2uMV3oWx9wQ8tL6KVwWEIIZPmxVccbS8++WtbsyL9RzOvwE5De5QeF/D72jbEDnVf
         b527fGBgT1dMJ2Py5ZWWWiR/fmv9UivqlCwBKtAas7UApyG4vlOh/mr7N5G7ASnUg050
         Sh9sutPxG8/bFpZjIwwvKiKQ3vmOpzlqqEBJ5lhmkUVrTsOYq8DEPZasN78IUzuApeh0
         jGYhmpdg+BbLbDWN7/3L0bv2a23RhOBgJr+9C7q68IN+2McAwdAjhnISG3RTyLkHoMVw
         W3neurF7XUk6jfx8MMnyK2SvHSl77Uns0Pi85B4RFqX/j9kUCIDgoxYw3wFmmvNQQG3j
         Ad0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091139; x=1786695939;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nmACaop3NpP/tkQpdGI9o6oXEIytD3NJ1p1fSFW/3f0=;
        b=mprv5RA7XXMSJVT00Ja/ZR2ETBD/hnSdMocQO8f2aAoyw/nc6gSBkHZtdnb+fWVqlM
         8XEZMAoSXypa4doiysQeRrN8MmR9jYRmUDnxjj+VfzjNXBdpbuRw/DyfF5JXS5dTPZjQ
         7ppQQsgKhUKGayDooMTbqjiYnGNn/dEjRr2pGEBEm7x/dto548XmmF4rOv6FymQzfb3T
         9Z7ZpiimidHzuEM9Hhjzg6PYlFVYR0NEofE8QwLnU2RaXXmyJlNt0nQzSCPth3VokKhk
         +n5n/e6/2FgjpnwgH0hHA1KIBVkVRdvxrTMrJIr2wa52DiSF4J+42CmxbNhLZur3hol4
         7z0Q==
X-Forwarded-Encrypted: i=1; AHgh+Rpy0CZGG4OAzr/wzt2Aaf5gYXGj7ZjMwH0IDYgieNF0Nlrw6Xz1WS6fN4YI0gWYByazrmmbiwDGkOFv@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyymu5kgxFWMLyRBbsPTpFzcxmHY13iBaX/uimLbCJE0Q3gLp+
	bWjtGklhbkF9pRf7IAytcrSnLqymPqncTovDR9Z2RDYX5PpuGmCafbCw7wuKqXT8kgA9VQLO5Sm
	X3Ow1T6qDKT5ictBBZYE8LpoC33oqA0GzC4TzbQNBaoya9bK4ZZc+jmiIBQO70U0b
X-Gm-Gg: AR+sD12eMfNP829PW5V37jg3IYc70dDAcfEM/XR/AvCn6cf8sGugtpcp6igic8KTR/a
	a5rqY0bZoogIC6nnoOnXUc5wu/AqODYKF12/Fzj4vT36Ytm7pfi46YeS7gJfrQWkM/IPAlSTDYO
	96kdr0n3LI3sV98CN+YFCu/gM836I4w06ozjTTlruTQT+4zC8TI2uHw1pqyajhHOkyBEj2MycQl
	fGjxlxjFR9zO3OwGc0U5WByyJibRbRPmqq/MS/Ri0npQk7hZq4Wu8BOfx1plVgFxEDgwqUL9XFt
	MyUWGUdRDOPtrRhj22y0XiYjefMIDixronDwgfLgW9d1WCctlXdSV4vFlEvvqBJLoad6hvNUu9o
	lEpuxLGt7CptZ6sdmEn/x1lgQNdCw10UxTCc=
X-Received: by 2002:a17:90b:3848:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-39261fb9e0fmr1999594a91.5.1786091139589;
        Fri, 07 Aug 2026 01:25:39 -0700 (PDT)
X-Received: by 2002:a17:90b:3848:b0:38e:6f90:eabd with SMTP id 98e67ed59e1d1-39261fb9e0fmr1999560a91.5.1786091139140;
        Fri, 07 Aug 2026 01:25:39 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.25.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:25:38 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:45 +0530
Subject: [PATCH 01/22] dt-bindings: media: qcom,venus-common: Allow IOVA
 reservation memory-region
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-1-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1455;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=BwrkrLsH1U6pF8sgcZ6o579AfE/d71IHNQRMfwrAtyA=;
 b=K4ivvscxw1dSJI1lnnbMBTcF/kp5bHd9GyCFzpy74rrzNyx6l+2KelLNUh1BkexlSwHWxEY5o
 DSq4wQ+Yn7XCzLJdnvaPlTBOdyiGa0LrmvSrf6EegOYAfPJKQhfCKyc
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MSBTYWx0ZWRfXzLy2xxy59UDN
 qiPHebqGuQKcbNlULWg6CRk99yvK5NZABEaCvnD0V8qth6+4NjLS2hd7aPskzR048BW5jMOVZmQ
 4EZhhAo5eraJOfiZLsFZTGZ50bpZcVenDiQFVrntVVLEPrbm0WTxR/DprtTxChEISuTrHcsD1qW
 W1poof2pHDZPBDCLo7b5hpBoPVlr4H3iq70HppaSP5fhtNo0EusG9CHO7bN3xpUVwj3AtUxToLc
 rg2s6kZLvNddQKnXVVKskRjeGyDspgNHtNqg9WDoYp1rcU+3w/6uL2XJdCuGZlTql5DU/1ZceNA
 lDrjuwn1OGzhIGxCQVtmCRYqLAl/H1IO5WWs2zah4+tP7exIpy9OGc+i+f7BTwl/9bz6qp739zW
 +HRiAgKlhzIMy80zvkeHQwNt9FUAd4UGSzm3AJxoClrw9JWnlwJ8MUzkwKYJmlL6yEPeDdaX4Ov
 m6fFWGRRST10eCMGxfA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MSBTYWx0ZWRfX2ssDfptAlFwg
 F2jI8zF/6PZB+UnsEo4tks1FVJah7h/urDiJnOJDe/TNIxA3mdd2s/RlSvdX+su1n+Dp58Zns8v
 m3jT3sPxkb3gb75AYk6vNK9dAtWxayA=
X-Proofpoint-ORIG-GUID: a2bG2EmdheuNOJKtp_QZIlSb_yg16S7p
X-Proofpoint-GUID: a2bG2EmdheuNOJKtp_QZIlSb_yg16S7p
X-Authority-Analysis: v=2.4 cv=e5Y2j6p/ c=1 sm=1 tr=0 ts=6a759684 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OD5a0iPE9_tbS_7HGJYA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 lowpriorityscore=0 phishscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070061

Non-pixel stream IDs should not allocate IOVA space from the 0 to 600MB
restricted region, as this region is reserved exclusively for secure
non-pixel.

In addition to the firmware-loaded codec carveout, platforms need to
declare an IOMMU IOVA reservation (a reserved-memory node with
iommu-addresses) to keep DMA away from restricted IOVA range.

Permit a second memory-region phandle for this purpose, and describe the
meaning of each entry so the ordering is unambiguous.

Fixes: f8cc21d454c5 ("media: dt-bindings: qcom,venus: split common properties")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,venus-common.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
index 59a3fde846d2196ab1e4588eb396012ba6860712..0be2f9119e78233928d23af86836ac294aa769ee 100644
--- a/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,venus-common.yaml
@@ -37,7 +37,10 @@ properties:
     maxItems: 20
 
   memory-region:
-    maxItems: 1
+    minItems: 1
+    items:
+      - description: Firmware-loaded codec carveout
+      - description: IOMMU IOVA reservation region
 
   power-domains:
     minItems: 1

-- 
2.34.1

