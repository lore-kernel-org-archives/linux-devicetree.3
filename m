Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E79338BF7D
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:29:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369743; cv=none; b=UJen46FJ0f304t2yluXaN15KZ0jlCGjcU2kXd8Fbbf18vDs7eTK3ZE+KFAwwZHdVLZG8Qxvh60U5yPUA84KKKEIcwZykafUXGP1yd42m7bzNoxkdkwhWZPrYyN156/RL1cocS9luTA9TF6sRUf0nOxl8CwV8ARqPCQYRbG9qrJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369743; c=relaxed/simple;
	bh=+PdYSZs4cfDhvr60AqhtuiYKz9hydT0q3cc55xpfa+o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EiBC6YZ6LJw+4Qm6ZFvAZfgT5WWmU3r9NMdqt0BygPTzRckzWRLYEZTUg4h0Yy23E5G2dSuaAq9JMZAmzCCheANmJjDrUYaH+CH4GWgvCPUur/ba0ypFIv8tBCelMvL6H2lEpvcGKtyZDY4rDG4ZqZZf6cXPPzkPZ5qtnbtVRUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R53GXR+Y; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E3lkMvjf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R53GXR+Y";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E3lkMvjf"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OBaobG1291144
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:29:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GKjf4cMxLUU8QBL3mtbVgd+l
	CX2aI/lvG6AlKaKpvPs=; b=R53GXR+YV3VEMi9a8cGlC9i6QEaJ7N8a9SNunDzc
	2CO1EWETMsKiXFaVG0FX/7KPcHpOnVVxkC6MSeqRxE0r7EymyzYc87Aw+OD24hpM
	dhf1Y4lyrbhnUxXocfULyI0s2pMzjtxYkiXlCB0jJq97bz6XqC4nsAhYa9mDWHLb
	9jZ5ZaowfTiH41jkUjK6wZFMEqHFznsVUnplDocAovmTCulEo9T2zS7SWoJjXA59
	gRAGv1SICQ3hLj/32leZqvdsFSmUDtC2+G+8AHZv0VBTsrpCT5kv7acGo95FN4Td
	fel0RUvzMIepCeY+9mJ7RCi2/1uERHg5V2WhUGCx0CeuRg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3sw417qq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:29:00 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50925fed647so98059141cf.3
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 09:29:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774369740; x=1774974540; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=GKjf4cMxLUU8QBL3mtbVgd+lCX2aI/lvG6AlKaKpvPs=;
        b=E3lkMvjf/FaQSXoMK5V3hNEyCCUVE9sPa/6t7H6W3bcrYPPZTtUpqsoNmmJ2XJIVDw
         5wU8xHNU7dHhrrL4wS3UeOVAE08FdcDclx/V4aWTgQVHIcOufsxfhNinm4TBuOlw9hrY
         5q8vFC1RCTlOOjSuDGspmzLLTp32KQ1V4Tob5dYZy6fN9uvIdF8cjrlPjpOcE91pk5Cf
         HLehZv/LN/0LISxyhI/wvi7pLW7FN395Mojt9r7Karf6RJdUCMj92Bv+xpqpFuKmk0x3
         2PutPC6IhIDCym7BeuHRyITXqA4GsY5HJ3hPAgesS6iWc5I6xuEMgCXKwihVVDxfhnVz
         bD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369740; x=1774974540;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GKjf4cMxLUU8QBL3mtbVgd+lCX2aI/lvG6AlKaKpvPs=;
        b=bwFj2ZE5uNZYlQmLCSIfj0DFTkrFEfJGmQlH8iAmA71tu/Hi6gfUWlFzKg73JxUPqP
         CW0+GJxA63nFSfSbOwUdFw42KqxSyD7U3Q2M+Zz9O/gmU6boMRTczLZhOJCD521yJpXi
         LoOkQ7t5Xx041qsLm5bbacrj6Egodk1OCbDUaCW5VE3nCzAaZGXrzhc8ejBU3hq4uFyP
         +4H5K5k5dgUPy6XZ3gneNn07tPf0nJCO35S5vVJVSIWuZ8F4UbijV4nQDWL4+vcP6BbK
         JGAiRQLWkL6OkXXX3BbyXaGhkuEikFy6hOBMmQ/wRXrSf6mgsbgMA1CdigrpPP4GmUwU
         tB6g==
X-Forwarded-Encrypted: i=1; AJvYcCVRu33uP1qe/d++jmOqm0/NS8ol+83+xHmhBSWQO/2ZQ/trDYY7U/3Ig7pmeMUwOxDpIDhONXHwSlqA@vger.kernel.org
X-Gm-Message-State: AOJu0YxmPA7L6957JULhslTOIirZ+uJp35XdA1zx2Gj3z1JlzZWaGFzS
	BC22F65pF9GZHxKaDllKHYTAVwm86Qt7UIqEPDWE6tUeQuGvD6pXKvLj7Sk1YOlHg5ZfB2VaO1L
	XEJkOtBjIxv86d1CziEg/T7LZSa0m81ilC3utuUJk7DfCIZnKFvRWj+bR1xSEKPNy
X-Gm-Gg: ATEYQzwAt8pJk/NgPd8xBS2yc+tuVH1tjOGKs38W4jn09zcwhXuXD4m1+p5F/b0Ed8A
	VkOpjNsNrQPtbM+KH4PV3OTgWtFavA7PU6gByEXVJ1YxMcjtXBPq0AlDszqQo2tDEtzalcmhpn4
	u6Y/QbJPnmd4AO2Nsh3PtBCpWIJwy9JcyFXQ3kE19aRp8CGHCLjK7x+jUuZS4Uw816OKUXX1Qqa
	hVIAibiRdPbw44FYGsfHwBD5aOTBnTrZSEcc1i41j0O4UasxCsspgmijMoVIYVhNA0qoJBPptXH
	fLJ2M0UHZDlTu9G+1yAbHdeRQcCvb5AWULM3rK1Ul3tsEnXuTutvKmVvPqGtkMqPx/NtqzE5Upy
	m/q2ybsDxFOpvuByuszigUHBDPKtZq7SbNw==
X-Received: by 2002:a05:622a:343:b0:50b:4755:949f with SMTP id d75a77b69052e-50b80e333b8mr3887181cf.43.1774369740182;
        Tue, 24 Mar 2026 09:29:00 -0700 (PDT)
X-Received: by 2002:a05:622a:343:b0:50b:4755:949f with SMTP id d75a77b69052e-50b80e333b8mr3886671cf.43.1774369739624;
        Tue, 24 Mar 2026 09:28:59 -0700 (PDT)
Received: from oss.qualcomm.com ([82.79.95.133])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48711702191sm58206105e9.5.2026.03.24.09.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:28:57 -0700 (PDT)
Date: Tue, 24 Mar 2026 18:28:55 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: patch mahua thermal zones by label
Message-ID: <nr2mw32rfqczv3wtfyqokqxtrahvbypxtf4jrvznucvp6ifjo2@jyt3fod3cvlm>
References: <20260320-mahua-fix-thermals-v1-1-8957bf976c90@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260320-mahua-fix-thermals-v1-1-8957bf976c90@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDEyOCBTYWx0ZWRfXxfN4wbZFJ28C
 SAmPF7LJhsQPfXv3EBO6UTxe8jN/akzFuQO+1ZDPAq9TnNeBeRIIjDBxg5PJeoNtW8tK0vAZbXl
 AZa2gVbVNPYQi2Cz9WLJsaJ6/vSkBx1ra/zMWA9uFSSMydckU0Xh/z4Dy1/2yzfKgStsNvMrsHY
 dor/0qbS+SNDZX/6OcNcNSIl4W/Yd7dg6g2z+baNL5hzOtSF3xM5tFUftWVnJX71k5bsPccmn8U
 AnlOjSJe3UOGlN5zZe5QzE+ScYrTbnf67KPyH1XUbl6x5OSg4h4ctwZBGs9uu89zV7RcNTXx85c
 6bMWECPywue1ycjr9Pu896KSWjmS1fPHa0vo/n/pEuNSp0NivzUNU4DwBh+lAFtQ3/IuBrvLbON
 2dvrVxJ7SQHSv9gsUMzFTIyZ0iIgv168lsCp48+uEY4H4PjESu5Vg8umZrDonMyB0kiPV6TKiwJ
 E1WE1R7kG2CqDsDfhMQ==
X-Proofpoint-GUID: z7ZuhoBlhPJ09mBgSE0hljvjqDwJRc0I
X-Authority-Analysis: v=2.4 cv=bpVBxUai c=1 sm=1 tr=0 ts=69c2bbcc cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=iKs3dpp2RB4k51ZqCjcyjQ==:17
 a=kj9zAlcOel0A:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=HjB67RblY9aCQUFlO1MA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: z7ZuhoBlhPJ09mBgSE0hljvjqDwJRc0I
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_03,2026-03-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240128

On 26-03-20 04:51:00, Dmitry Baryshkov wrote:
> Updating DT nodes by the full path is fragile and frowned upon, it's
> easy to miss the rename of the node in the main tree. Add necessary
> labels and patch thermal zones for Mahua using those labels.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
