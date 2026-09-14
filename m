Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 902CD46AA6B
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:48:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789393735; cv=none; b=YcuStsYXCx2noB4tOchejcJ/miQ66cANg22HVZ0Ilg4TSKmrWCe7QuG/liIM8sEM6KwPsZBp3lwW5PQ3vzfROcj3M9ldHQ3gUJnDKqhWZAAz/f33mjrFFCNI/0jU1YW5JB8Kt/yRP3Jp8nN8QKvapa711rsgmm6f0ldbtXXV2R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789393735; c=relaxed/simple;
	bh=Q8ZXy1xBBvy8lrpFzAtZcyAMCBcySBhfVdRbhCWPp14=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZdS2EI6y5rUWxaIFaDWvApGWvRIKiu3Z8nWp6uqWyTe5CN8B7cjfxIf4J6q8YZtLtuKw321+8MX1vufBhdTP8lK7bYs7Wk1Nbk9b0CeTB9lm+eNDboDU/I948zHuRMzDcQRokD1jQo2oVIriNhuj3/gSGu7VMY9Fkzn6EZsnrs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HUu3aVqF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AECIQ4Zn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HUu3aVqF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AECIQ4Zn"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68ED0aRp830774
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:48:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=HMyYfEPKVPkxA/d87ABHMAG9
	5ycoJXhnJC7wLe1or9w=; b=HUu3aVqFiirJA9RCbcMDlhxUU/oU9tyKPaXmtbxi
	O0uxFCGk7fyPJhc5XGw7uWWb7B6FPp4qB2HRyLpGaLZpKySgIYQzne698TGFEERb
	yNYeTHuOgKHyApl0wc+UibOseGORQ7hGNTVlqIHkdwD3wpw+sFhrNcKj3661TyNd
	c450Ma9A3qokdqKGzTYKB2U/Jw8v00lQkGK5NnWqP1itJ9fPsf4oQoSub00iQpWh
	eoa99O5I8xNyOVy9yHOOpk3+YjMPfmyxJYyv2S2gKMuvny2cIlaiF2e8drlCnrUS
	ktr6u8Ago/70Y/Fg5hagacJarpTiUlgfLWva2lMhpMa/uQ==
Received: from mail-vk1-f198.google.com (mail-vk1-f198.google.com [209.85.221.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gp3hstpnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 13:48:52 +0000 (GMT)
Received: by mail-vk1-f198.google.com with SMTP id 71dfb90a1353d-5c7a31f3af5so1181959e0c.2
        for <devicetree@vger.kernel.org>; Mon, 14 Sep 2026 06:48:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789393732; x=1789998532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HMyYfEPKVPkxA/d87ABHMAG95ycoJXhnJC7wLe1or9w=;
        b=AECIQ4ZnqFFU6wPCfxhYASQ3TrcY3QvExsaA4qYkdakzy1DYO4AVdv0vcwCMV1Lzjo
         NPSTJR9FXt//6GXKg7NJq7gNpFxNwErmxu9e4kKy8g5tYYGAJ9NKoLNJwRo/IkirxP2q
         aYDZ/b3bh3mD2svDybFUy+MC15e4JZMR93Z7n0Los4gOXS3d1Sku6fkCyhVkW04FmL6B
         0rC9xMkJ8Qp2mfzQf4DVy6ZNXB96QJBEQQL1n5aL2ZOrvWb8GBtdHLtuJyYNfQCDU849
         7cdAS8kfZ6jeqcYNYQXnacAAGwI1TBwPU4tOL/exZrCU4O601f/o0ttqn9Gt7NswDvXI
         uAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789393732; x=1789998532;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HMyYfEPKVPkxA/d87ABHMAG95ycoJXhnJC7wLe1or9w=;
        b=ipEZJXK2IGC5zSsA1mB2XegV0Z5Ijptyvsw9x+iwFaBo5WQAsHkRIqSGZ0BAlnEBhP
         g2aUJAVW9IKVnPZPr4yvkwq4SLiuek4qWHnezijs4Ctl2hs+ZkYSsktm1HuErMIjcPia
         dYhEoRTc2yT+HGAPf/w126KxmZILeP3+dDILTqf6Xcpsq6InNh6jvWwBmCjqGdWcmmTK
         8sJsRqWGjLaasNuuoHwe0LnFngSi72vMcBL4eagi1AccuBB8ci+IuZO1pI/gDXDlWg/S
         EdGrpFEJz1NX5l0EFtJ6YIt3zKRl88V+YryuF21IUMyBZc2iOcO8F/vWKhJnKRhAxff+
         ghxw==
X-Forwarded-Encrypted: i=1; AKwUvBwB8fojeZnka4aOKG20dUr2SpYqEcupOPepdTrcyT3StolbaqCdMjDRspkDkWITiVJuBH7/0vbm6THI@vger.kernel.org
X-Gm-Message-State: AFuF++mok/6LKt2HX1OSuBys14shj8N8gQUC/gCqkV7K0Xj18w9m4jg1
	geOyN6xZD/LBsrO4hIjfb14eUXV9Wz5CAlPUn/w7VVlPHiZZ3sQWsEelQVMigPJWa4h5ZIC0Qns
	U2N8nICgs20+E0XM3XVBJU+0+Zo39Nc0tvXWfhRp9m8OD+HIJvkdpEgPXcnliF0yR
X-Gm-Gg: AYBFou1TI1qu2QGLS7WTBUZtVdsvGZXgkGfF23P0HSxStJxUcFW3ErKcf+AiKZC4gZ4
	1xFU6Dq3VlwIvkgbzTMmByF7ulSmbLX730jvMgOiNCh4b72AXT+J10a/b2aZhNt8QRGCeRN02Ta
	dQ285i4YV3R4postmuBYVHv1TOdLjLtEJqEotvmBRNohKqRLshg6+xpwVF32ct5R1fEH6w0JS17
	k1CRZgoEijVFlTNmYGzRGSaT048zABaZoPObfM1hoUX+R1clB7M139iZvVUzyO7wVbClzinmv/F
	xWI08WkzUhaGBzxVOv57ptvl3ZQsyKGU35cxDV73WNQ7O7azuiAEgUE0KbuIn/uyseVmle8z0au
	kuHvvq8H9V+cKhg==
X-Received: by 2002:a05:6122:469f:b0:5bf:7f98:9657 with SMTP id 71dfb90a1353d-5c981d4c288mr1986371e0c.6.1789393731576;
        Mon, 14 Sep 2026 06:48:51 -0700 (PDT)
X-Received: by 2002:a05:6122:469f:b0:5bf:7f98:9657 with SMTP id 71dfb90a1353d-5c981d4c288mr1986323e0c.6.1789393731045;
        Mon, 14 Sep 2026 06:48:51 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb360409sm25548638f8f.36.2026.09.14.06.48.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 06:48:50 -0700 (PDT)
Date: Mon, 14 Sep 2026 16:48:48 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Yu Zhang <yu.zhang@oss.qualcomm.com>, devicetree@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] arm64: dts: qcom: nord-ride-embedded: Enable PCIe
 controllers and PHY
Message-ID: <64swtxcifxs76ke3hvjk3t6b5utapnlptwuaompawxks2332zb@3vi75y5zytt3>
References: <20260914071944.164217-1-shengchao.guo@oss.qualcomm.com>
 <20260914071944.164217-4-shengchao.guo@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914071944.164217-4-shengchao.guo@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE0MDE5NyBTYWx0ZWRfX9W/9CP01OjPl
 1XCaOIL0k0wEgLQHSs1LicxzN0gY65a88gREDGwJBQklRXMRZVvHui8jwCfcSi3h3O3elh20X6q
 y6/UAQAUjsSJ5JWXT5AOcKdk0kFaQxVjkSPUdCs+G8d8bz+wf5kXk53cpkXLyBdvgVtwXuBn9Q/
 CYT3HBg6XaXizu6LH+iwcaaMpr3HbpdDw0m3IAcmyE+yj0GxHQq3iF5dPzc6dNttN6cazoir334
 wOJk9JgwDr2ohS9Pn/5ae0xtm8poxhwrLok/sIZT8pLXhxBBM5pPUUnnZO1iR2ozpbFdhnA/Wmk
 A+UykadCO0DiG8ERrogtFTPw+UDKbwBXb1lYf38cnCIU38hCHiQhWfozLZOLsXeJrkc4DIycres
 kk10f82NMxezA0dmRnbWjUy6/Vx0aUanFNcuZROokscTv/I4LH23PnrSfJFMIJXb1vvO7QiwlY3
 MOZcRPqD+PSprUefIXA==
X-Authority-Analysis: v=2.4 cv=IZwSymqa c=1 sm=1 tr=0 ts=6aa7fb44 cx=c_pps
 a=1Os3MKEOqt8YzSjcPV0cFA==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=EUspDBNiAAAA:8 a=393rYoDGjkx6UDgLgWgA:9 a=CjuIK1q_8ugA:10
 a=hhpmQAJR8DioWGSBphRh:22
X-Proofpoint-GUID: s-YkKrmyaZeS68Zoi07WB5cAD8ZqmK9Y
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE0MDE5NyBTYWx0ZWRfX+J51d4l/6ppK
 2Oq/XuU7TtiX6D7SDmZ3fT/mUEaWrKOyec/snCm2D3aDdVZ0IrR/9I77tn0/VTP/SG3vjkUMUYA
 MzR5GB/ULFSJE163MmrB5ANWj4O7x48=
X-Proofpoint-ORIG-GUID: s-YkKrmyaZeS68Zoi07WB5cAD8ZqmK9Y
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-14_03,2026-09-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 malwarescore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609140197

On 26-09-14 15:19:42, Shawn Guo wrote:
> From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> 
> The Nord Ride Embedded board routes all four PCIe links, so enable
> pcie0-pcie3 and the QMP PHY, supply the per-port PHY and PLL rails, and
> describe the PERST# and WAKE# lines of each root port.
> 
> Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
> Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
