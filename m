Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793010116;
	b=Jyu9YBgIxdkSCudCTKjCYezhoUuhrRG+fmfk23IZabF3VXIUEobpg5vkxBiEXhWq5yGn
	 Q8jh0bru1Y8j5AbkXW1JmRw81G+SmexYg/wQ8eg78HaqcMkNSk7hM60vb/VIc9FQjLuUc
	 UTt6ZZ/DtNXMQuaycWYTwpXUBR+mSEea8sPywaTNEkzUrtwORkumKWgvKhkexse9ZeATW
	 rkoyyMsZfuLQYJHOTRb0pw/eCmrp90tgLyt2M6qjidbY8Vl1rAAMp0rk0D6m+IeqRyNXQ
	 2lTGA3/nZ9fI4YM9fQ5l0DU8hGANETOYl5KzDWy/Z/FJ78DLVM448AMN8/9WTRcBn8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010116;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=0xhKo34CJdAuf3/dKLVI6dELXrg22yuILdTnp1uzGF0=;
	b=k/8yE2W1HECG7FKpUz2ROMHRvYtAZ7lWJiIyOGvx2L6lGBgmhgDKXk9wvzesxp2/x2NO
	 DdHosOi/Q0nIrXCsaQNxEWsoHgpXXAin5Y49rXxIAjyZhlFvVSCRGJyo3aclMzxaZ2CSm
	 SEgoLtNsMEVITgpQC1ZoKTsJAFV3p9TgL/aIUFWtAin0KUVAbuw3PaCFaPIn8Gky5pwlh
	 yIW9UxKbQSZMn3qzQuNZ/APmtmvsm868Z1adG57QK2VGjlhD/rKdOv2cBHPplHKTn/7O9
	 Eh2an+WqvFAtzI5W4TUmxXtMQif56N5kRjaxDRET9+L3vU8Yrazn7J+CHQJdDaTaNug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OS5i0lei;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bc6kui8H;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA8B606A328
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:21:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAA8B606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OS5i0lei;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bc6kui8H
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4b9hw718212
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:21:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	0xhKo34CJdAuf3/dKLVI6dELXrg22yuILdTnp1uzGF0=; b=OS5i0lei1ohGckgk
	LVcMu/jYPZKAuABOyZsoNC+h5dRCUfH/GbnKbZ1ADqvvkrJmhL0yatJhg4M8QUYi
	XpvXhluNL13SUs7P6oAjEbDEohq3dvXCaKCP1Ogy+di5E1b7sw/wEIa/gcA4nke4
	xEbOgsHu7kk+mRw4y2lBfRrI2X7itoAd3DWlTsdLWSv5tTz1JghFfnM3+VDy3TF7
	oUVT7PBiU54FN+9Zvwa8xF/wCZy5Nh6P0qWNaedQQzXPxB977+eh54Rd/P4XIQl1
	kTqqZYE778swsIGfAAsUQtuiSOrD9S/jcZCsPU3/2PHle5SqediZLpRPhwtkcPt5
	rBC62Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhsgssytj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 10:21:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f20addba1so565574885a.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 03:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010114; x=1793614914; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0xhKo34CJdAuf3/dKLVI6dELXrg22yuILdTnp1uzGF0=;
        b=bc6kui8Hxjm8/L1LiUCNEUnhUmvqkCx/W/HWctG5Z9TQkLS1ICjqWWkOyAgPJi1b2k
         oVNiMvwiGSdAD8VwYDrm09tGOWJeuA5dt1LJ/VKOuhJVDoH3EusexwloCrs2y5CN/HoU
         3+6gCJ/W98YvVt3rB08azfUAM8tG4b3pJVJGI/4B3YOf4HALI5QCwGjH2MUq6dMPY65k
         nEuhL4PIzDXehN2lNgv7Y6hKNnDLlQ3KiGqOI0A+vhPRPSTusBao22jh89GJQ4fgywJi
         eyTguFlJzGKBbb8JWwTvy7ACEux5AZZ5J2oUifLolaFcfP2FdPD7p6E8/1RoC5I9jYXE
         kwZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010114; x=1793614914;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0xhKo34CJdAuf3/dKLVI6dELXrg22yuILdTnp1uzGF0=;
        b=IQq6RPYrKU0YmcGC9OTDQifKOLcv5UdXKBL5y+o5NWWDyKpWwwqvqYBiSca8U890TL
         NuOT5NVUDbaCz0TawPhUEuMH67BjXHYwgNsI4ZaaDOa0O9bNZUwhNmPfdR2IAoRpqDcf
         biWtK5h5RKzSCOCL2ayvtUyLwtsmFkfoDkphtox4HV1R1cLQOkFLAF0Hy7aKOtLsxHU0
         fEmDybnIE8Q93AgxszaQ3D7/9Z/SUY8yBCZZ5oZaAFoJpvnMMPBnA6/8Tr94fEYi7ZWS
         42cELAqCn2nss+mpRQGLmL3fnR+UN+tC7PLjmTy7gkLu1TcOyDfZg1TW85oFMl8IgYeL
         M0Zg==
X-Forwarded-Encrypted: i=1; AKwUvBz2SCy3kRGIgyXLzdQk2NnioK4Nwt9fBARdxzE+x16MWec+J2mTiCeUxOtCGVK294APVt8akvMZYN66@vger.kernel.org
X-Gm-Message-State: AFq9FYKPto2UUIGvO1+YjKlHTFcTCnRUiDRyPGgTVhMj5ISUig9ivHuD
	qJLT0y2rBZxZdhhnDLPtlsVTUM2RIIElIIkMdFRRnkHfwJwSd9w6PM8aR69NQX7mFH/a2CkOY8X
	JYn9m2txyM3WYmWKolqs8jl2b/GXKzHltUIvo/tI+NjgkgvRVAtgfZAczpMlqjoKh
X-Gm-Gg: AYBFou1KeeUh8Lchq4ATo/SsFxRdS5AZAeA2cxe8hrsmL/scK1LUCTOr1lJREHlvzgk
	CJu35rnPCPyUDA4iv5uIUXoHml5TAfISb/50Fon1C/SELCK9Q5o5UG6w6bsF3IJgGkPuV12+fqg
	4EoP0DVe+YLhpnYvnFCPTafbiM2kqhLEIIc9ufUJn0zKMxxOwJhpu9p/EUk3mWM+sQzH/3yTFAr
	rWND/GOTx4xl2aGZRiHSG4Xl3ffAjgFdNcvXmNMlKmsLBhjgTdfT7CTRE8J3qTBWwifJRL3mTpB
	rI7yB7/K9do/sxsZj8PtLzpIzmloc3nMKpb81I8jcjcFRQqCu/2E/C7Tf5ccQImcCRkRHL5KeVc
	d09v3UX8Z7Q==
X-Received: by 2002:a05:620a:4001:b0:93a:1048:7d2f with SMTP id af79cd13be357-940ef93327bmr857663485a.41.1793010113964;
        Mon, 26 Oct 2026 03:21:53 -0700 (PDT)
X-Received: by 2002:a05:620a:4001:b0:93a:1048:7d2f with SMTP id af79cd13be357-940ef93327bmr857658385a.41.1793010113280;
        Mon, 26 Oct 2026 03:21:53 -0700 (PDT)
Received: from [127.0.1.1] ([188.27.161.187])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a2ed5a2sm196226895e9.15.2026.10.26.03.21.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 03:21:52 -0700 (PDT)
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
Subject: Re: [PATCH v6 3/3] arm64: dts: qcom: sm8650-hdk: Enable I2S for
 HDMI
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
In-Reply-To: <20261026-topic-sm8x50-next-hdk-i2s-v6-3-0bd654b8388d@linaro.org>
References: <20261026-topic-sm8x50-next-hdk-i2s-v6-0-0bd654b8388d@linaro.org>
 <20261026-topic-sm8x50-next-hdk-i2s-v6-3-0bd654b8388d@linaro.org>
Date: Mon, 26 Oct 2026 12:21:31 +0200
Message-Id: <179301009154.3833661.4687696587079846041.b4-review@b4>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=297;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=VDfkl1pHrWO8x5WUnVdyo5RLejkVUKoVvIZynsPeXcg=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq3ym38Gmfkp+9CDmzVg0zP2nOPOUWypdKV7+Xp
 jhzXrIm6PyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCat8ptwAKCRAbX0TJAJUV
 VpJPEACS387mP8Z9JLiUK/EEcahtHNDmtIgNJVSXO1nWeI8H1wYGkUTK4sHFzaNZ05wvvk63nbs
 vv4Q778+7kAvRUomzy8jSlM4Aoxz6CnDdIooM68hXf49sIVh3B8P0jyvJ8v8+Qdg+oUHiXOnEu9
 qs80ySTK/SN+YWZ21Ii6gS1YavOFd2vlGfCFRJ3EEvYSIMVdt+yjlsDgwvzOxMFVvpfa5CrciRR
 Eo1QCQyfMOnu5+fawkvFmVGVgo2lMpz2HyFkzXFU+5b/028wyk8iImUCYmfETXh88uYXYwsBbPo
 5uLGAlcBzlhb7n9BfPvyKsTypTu+L+MwRhfWTmXrFuvVcE/0Lnh5D64VDZDbdNtJqr8xYeD9CzM
 NfvdnzRikPTntBuPb3L+UVeacr3a68E2DLXZ0VoAl9iQylYw1daIEDcHp5u4c+s1ATT4bYojV4A
 JrQntQnhdcAN6/lXlgQ/XY+nnxKmE1Ql3Dxsrw2OEDMJL0yYAsv6WJk1wBUQaeTjZZc3QDfJeMo
 Lw+AY8KdIuxZMg79gHEzuei9yrAtIEfnAHhSv00L+54UoAq9A1P5xZBFfritdahfSuiL7xqLYmQ
 sEijK0aqe9CMFAbjXTKF6hS8nkih4QJi3igWYrgNIR/pfa3Drg4VMURWNBG+1IdYm4GHMMdbQVj
 n6dp4MKWAWerh5w==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX1JI8rC2elS8Z
 FnnETAdpBrVu8YIpGGBFGcunaSmruzjXL+TIy4gjklRSO1nccb6i8SPMdqUET1wYqaM+wNWz7tf
 HHSg9ppaDB9cMAY1/wB3h020OrMsl1k=
X-Proofpoint-GUID: tiyKbJwiyZZqWaGIe6YdF6GdaJS7H-1A
X-Authority-Analysis: v=2.4 cv=c+8+0h9l c=1 sm=1 tr=0 ts=6adf29c3 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=Qvngrl3H0rQgGg+94q4QgA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=ji0esM3nnZrMOXJC16QA:9 a=QEXdDO2ut3YA:10
 a=3Q3lADbaBCgA:10 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: tiyKbJwiyZZqWaGIe6YdF6GdaJS7H-1A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX8YikDAo6fyM+
 njwzIqVxiqAyGU4sk1cgzhZvlijWrEKnPgZ7Hp4jvYUiT6n6I1dkAElXgOkzG8DglxagVkiEeta
 1RlWPxYzQYLUP0Y+O5o39ad4wYk/Nr80sTMzYCp6OZMfh26BQnR4uTp8UBVx7WazEdigEpinUcB
 Kq7y/fAfqIPmllw/QeAP1Y/DBMMnkUi9ow9l+6SHhj7QjbNeNLLhL843bQxPKZYm1k0P2yVE/yX
 vwb7xuklSuZaEfucph2CnrkLGE5j9u+PtYnlCMM0/K8eor5ITFddOrd6uwHZ/soc7chONN9eYz4
 zqz4g2Og83IkOn7GM9bY+Wn+O3FYjXsfDK8QwM3vXv7yL6tEMEynE54Y2kD4kf4hHsYEJhC15JL
 1PBh43hFvNEyTPvZ57BnlBHzWDxSYaEhS0t5d/fQ+SyaGhZg17HZKQM9WxvIeVJZtT3sVb699w+
 y1pW3hgkH7luteTKLfA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 suspectscore=0 adultscore=0 phishscore=0 impostorscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610260041

On Mon, 26 Oct 2026 10:50:38 +0100, Neil Armstrong <neil.armstrong@linaro.org> wrote:
> Add the necessary nodes to configure the right I2S interface
> to output audio via the DSI HDMI bridge.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>

-- 
Abel Vesa <abel.vesa@oss.qualcomm.com>
