Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 183C233B6DA
	for <devicetree@vger.kernel.org>; Fri,  3 Apr 2026 19:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775244436; cv=none; b=fVgs0kkiSSFBfD9PHBzdOw9NKPHq4N7SI23dPRD6CudojdNch075WB8ZRvje75mDP9l6rZn+QmMulQeuX/Q0FRcXYijgWI0eXHCpg5kEbpg+O/NNKlhzGRGvkLWr1INYieTT2V0UttAtIu4xVNiJuLTUaOIb/j+MRUXu/kgE0bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775244436; c=relaxed/simple;
	bh=OU3SFsCVwVCAtNYnROQaThuCZy/FsLCS9vTE9MUGr8k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AZu1Txx9mk6nsGvgol5ADYG8HVGvIZ2VxN9HOdIkBtLKXDuOPXelBWnd+6AZxlJigNVHD7qxiSOTxZvXEQOywk4aCvSCXxIFBwOogGipvOIlUCmF7xJOAgEt4eKWHQANDiKgkueGXu23ERglWij62nxpYOLTGk3rfQoZKlyIgr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EXSIPFJy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Zunm/znt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EXSIPFJy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Zunm/znt"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633FuxGj258363
	for <devicetree@vger.kernel.org>; Fri, 3 Apr 2026 19:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=EeCH9MesYleZ440DjmzWy+Bf
	mTOxuDkYk/i+DHg42j8=; b=EXSIPFJyEMHuMoNIEscCihVLG+TT6JAnC8buXY/v
	mFHjcdfXBtXC+y6UqoCtQWrFAwwZxHygD+o+LQektSBsm37VZ6EgK+jV3WXP4QMQ
	WyYU4QgIJsNE+hPKZWEqf2bS/xVEcDltVpHk2wGGpgZgkvFf5zzmqHyoyePOXVpi
	6AU72sYWx2mNOOL8ki9EMdXYyj2CycU71pM/gmniluOAZXlLWbnqjnNlKuTeSVx4
	QIGDCgUHcGRQUv4mtLnnBUFNzrXXOcVkrlrXX1lDxS03eUyz9i0UzQGOu5aPlCC8
	BayyaSui3vxSjTn5S5cAETdIb4WtGCutIuU8rWpU7cgvqQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dagn20jc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 19:27:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5d1c2289so38201781cf.2
        for <devicetree@vger.kernel.org>; Fri, 03 Apr 2026 12:27:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775244433; x=1775849233; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=EeCH9MesYleZ440DjmzWy+BfmTOxuDkYk/i+DHg42j8=;
        b=Zunm/zntueM8AV7lkTvD3jJpxhUDIQOBVV1yLBz2qPFPRgQ+u9cMBMyVM2s2RZ+e1L
         nSpIju/KUighKNP7q7Xk8yguGzPyBWofHCSgamm8qJZuVo4gd5UkSla3EciXvvLasJK9
         O5hR3Pg/dgyEQsUmoPN7Xk4Mwquw7gUdUwfel3hZ2O6j/0oooXhb2ZnUov1HcAZd91mQ
         qjTTcFR8bgzB3+1YKV3iFp6ZIJvZd4DCUrNNADqMXXvh1APuLsdB/28i4K88Y19cbXaN
         YZJdruF3dFvL3h7A8az2YnVB6W+CnoIjPJp6wXJfcQ/vUQHZW8UokUwSHIstVY/hb18K
         SlaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775244433; x=1775849233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EeCH9MesYleZ440DjmzWy+BfmTOxuDkYk/i+DHg42j8=;
        b=ejdtlB3n8UgcFF3kqgZk4LixSgZZcz8UmDSe4MXjAHyzDLu8qF4QtOPgGaFknChflh
         qUb4/rRkTOAmbK6CKtJyK04amReyIQGh4HhCzV08AZPgxtt0xXaik6ex3/v0Y6trUUi4
         9DpeX14IZYnhi55X3+YTB/cNA66sR82DZ7BTmN89bwNzYIJHVKRmGqqyWQ+9Cped1/lK
         JL/6eyuWIkAwMDlouxaZXBM9cFWeJ8xDvSQ3Qk59Ohop2T+HmdW3VxEwJSQ0gUYGkknY
         ASNTyelJL+npHAqvgw0DiupWmEcrqLpcil+TwohpZX8pcH31v1NNOnqNb8KRSV3sqLQS
         Itag==
X-Forwarded-Encrypted: i=1; AJvYcCXDOsXvk8kcPlZ+Ksvz9TpzrUhYz0MqariKy/UjDQC61TOWdrT66Pa74v0/cMEez+xCyj3kfG3Ahy0G@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5iKZtUNCvwzFYqVlnzOOgwol2ERBkPxiZQX9E91EWaCDVwLIk
	tbvpOGBb6eq4TB7+9hBWSHDKDHGiXjlQS3gJrb8YbRZsJnJi2T25mcAeNzL5gdxLvVnJyBu5H4/
	ia/km1gqHKociazQE9dhQGcvGaMHvA2Jmwq8J3QaOO+AgyW/oIoTiOHRhiO5Gjn+s
X-Gm-Gg: ATEYQzybN3xAnhKcuBJNL/UBZ450pEzhXH2fcef9lfOXzaagC4wkIdSzZ3ESVW8LJij
	grrVYYDOpSqv/19bfP0VwfZej48b3vqijuBuiFat9NQ8aA78wQBb8xHPm5N7D9a8q3qJZd79syJ
	QqHt1QJkcjUNoERrAECyiHVBYnBwriQhVv1AfrWr5MMdVQ1ZUmijU7MZULYxmAfRoCCwoDPt/tf
	6wI0o4HxQbubYov2lLAnsDbnHRHWs6ImiluZEsuZceNU8GfF8NrOlD3VQnj2ZfmwbqrUk+AS/J5
	eDr51ziZoUeLLjiJJ0b/dUL3lk46om1kefLUTv5Z9z/BUDssdfHzwhRIfrvUKdxsswKnL2bhD0B
	Fa429z6HeM7WiFUy38IqbauZJnr9vW1LVwVfsShbp5bKPnEo46qDNU7J2bcx4JISHqyILChKqRm
	TvhFfYWOTc2WiB5Jeu5HtuqCaacThFqHSii4A=
X-Received: by 2002:a05:622a:5598:b0:509:3cd:b243 with SMTP id d75a77b69052e-50d62773eb1mr67413161cf.21.1775244433475;
        Fri, 03 Apr 2026 12:27:13 -0700 (PDT)
X-Received: by 2002:a05:622a:5598:b0:509:3cd:b243 with SMTP id d75a77b69052e-50d62773eb1mr67412801cf.21.1775244433039;
        Fri, 03 Apr 2026 12:27:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cc6089sm1638171e87.50.2026.04.03.12.27.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 12:27:11 -0700 (PDT)
Date: Fri, 3 Apr 2026 22:27:09 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Luca Weiss <luca.weiss@fairphone.com>
Cc: Alex Elder <elder@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Alexander Koskovich <akoskovich@pm.me>,
        ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 5/6] arm64: dts: qcom: milos: Add IPA node
Message-ID: <qt4hktac7i2nwuoenlbu4mujmlp3v54ak7glbzu2roxvz5otr4@ehkqawyhiqu2>
References: <20260403-milos-ipa-v1-0-01e9e4e03d3e@fairphone.com>
 <20260403-milos-ipa-v1-5-01e9e4e03d3e@fairphone.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260403-milos-ipa-v1-5-01e9e4e03d3e@fairphone.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDE3MyBTYWx0ZWRfXwas5w+Kl1QMv
 SiuxU4mEU0iiwhZ/AXmsA7DfUwGbHMwqSi1MtdskJfdMNn3bCY+csrLQV/uZWPGosCf2TtLKe0r
 omkvMMQWmgtLy8DMPbhMGG6r2KX86xvfYQphsKPmBiYtNsZNDkodMV9SDNuUe/mQduSNhQyCrDS
 pvD3PSziS9saHd+YgPa319mdlD4/iEnm6uElDa+5qaNj4EsW4bfsKfLzFluyny6Ftc4iHm0e1UX
 0sodTx7PW6Or+KV+JWr/l1Wz36ZkvBPkP9YiGq67J/JiVa2N8blrOlxDbc5sOUcR6Bx5PsdPfkd
 UfqxoN87U9k5iel2D1NpsyWvaXlWLX0HXu7hKfntdOOoUd7uzx9vwp8pB2i1CCBeQsHORp8kr4h
 eP/PQx17r/aoQkRzGnqGaD4j+h2TLaidigiAKX28vaoch3uW1Y+ZyPdZPooKPlOR+03fvzNbMiJ
 hf/ccYmEjRC93aWGsSA==
X-Authority-Analysis: v=2.4 cv=Cc4FJbrl c=1 sm=1 tr=0 ts=69d01492 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=6H0WHjuAAAAA:8
 a=EUspDBNiAAAA:8 a=Z1Ti3UXaT223yONGORYA:9 a=CjuIK1q_8ugA:10
 a=a_PwQJl-kcHnX1M80qC6:22 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-GUID: 1LTxFvD49V8mwQZDStWDWLMYTZZaQCvg
X-Proofpoint-ORIG-GUID: 1LTxFvD49V8mwQZDStWDWLMYTZZaQCvg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_05,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 spamscore=0 clxscore=1015
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030173

On Fri, Apr 03, 2026 at 06:43:51PM +0200, Luca Weiss wrote:
> Add the description of the IPA block in the Milos SoC.
> 
> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
> ---
>  arch/arm64/boot/dts/qcom/milos.dtsi | 44 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 44 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
