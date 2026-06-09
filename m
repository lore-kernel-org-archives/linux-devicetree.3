Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B563C1994
	for <devicetree@vger.kernel.org>; Tue,  9 Jun 2026 07:23:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780989837; cv=none; b=ATrl+1zSu/+u+3VtmvYHdrburRRYgGPu9G9R53LoPV1soMONg1yzXadBoRlmKgtuJ1zo9KXtnoi+qSeTI3SAPGMLZN1EMT/JSLQa10qTk/XLHUGRecb0TfvyQs1e4fbMdLy3vVEqvbXSzEBCKo1ry56GkDCYGlZNQ3cg38WMIc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780989837; c=relaxed/simple;
	bh=aylCzX4AQA8KEUVc1RlQbf8Mq6A9uSfbo/tNFCO09g4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m84btp4Ny/LVotn1P16Clp9shFEXtZ6m+Qf5PNyh6eFLIt8lrWPahg8WXYxXQcATyY5tImZ3vBGIsDyy/ZLsvKNZXltibGl75pcmQs3jIIfj1PcNG5lajhFLdIgboXprt10KhWy91NEp8QlopdcRoXocySvjLorSj6jcREjrx9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dRAzBHgj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=E/JPCe74; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dRAzBHgj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E/JPCe74"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6593wxd51499044
	for <devicetree@vger.kernel.org>; Tue, 9 Jun 2026 07:23:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=26ctOLrG+LfjHtllnuTsf5tP
	cBJk7XWtRnEDq5KZ1vc=; b=dRAzBHgjI+X/qTcFzoUztqNcAfkx263QVP5Wzndw
	lRKaTtANeJbEYfIXHHTS6MYuvu8fXbkk9mASvntOzkxB2VeYShyUx3QYnxSaSf/g
	+dyNyB4e5PWOhJVf3vvnEZwpEPYPHzoNRi1Dpr2ZtbLHytu2rL+3opBMqx7jxUbk
	TJ2tj5pjV1oifggpLpwM1LFhDzCvqIX2SO7OuJ1H81wQ5Ycy03iiEySxoakcHjW6
	G0jKfKIMdenfrIkry0QTlwmd19Ho1jJfbiUljMlc70wXdRBBgUL9RW5kCYe6RA6z
	Dr1x0XzZCqoVYT6ODSg/eVJhV02FfcTP5dWTIUmV/PjVpQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4enun8n1vn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 07:23:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-5177b8df670so84728361cf.2
        for <devicetree@vger.kernel.org>; Tue, 09 Jun 2026 00:23:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1780989833; x=1781594633; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=26ctOLrG+LfjHtllnuTsf5tPcBJk7XWtRnEDq5KZ1vc=;
        b=E/JPCe74YH5xkyH+DgN66MyYMUXHOphKGlhOLBnV0GsAuN84wC2OlfZgKrQkZJcdAa
         jg3NMSKo87l3jYt4kAtfO7139eB3fEnsWKV9NE/UM2zOfN8XUNDGiopYwMciMGQ7EXuP
         f4nytLn7j+guwTzy9ZNtVj6vUpu7Z5UrvL9Rakc4HccQquJ8HEC2U3JNY0ltq+PsIJCK
         T7C751IhNbl8OwCMIr+6I5hK3ANFLIqFI3rPAzBIUehPnfBveGVgbzjLt6WieRKdDG6s
         90stmSeDeBCsF257wzMeJZnl3zYR5CMVF5mOtRX1ZE3Cz5LPzf90bMUGqlFcC1bxGS6Z
         CfEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780989833; x=1781594633;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=26ctOLrG+LfjHtllnuTsf5tPcBJk7XWtRnEDq5KZ1vc=;
        b=Kv9snvTp0vwbXwvkpzNciqCXIlWB15tlEO3xLpAHvMc7MZsAxB4+GAGER1L+uaSDze
         ldxU3GH0f4fwhPoEZ0prg/Dz+9KGuJqfpzvCDSCaPeFTnrEksPNPDY115Wk8vmxuHgel
         s5SgO4KZhr2AYWbP11W0f48O8ysCw5hJTeQDcFz71lZ7Rvp1Qm+o4VliA+K1JrpviRr2
         kFl2jG4MvyOoGPYjcf7GoF1qkrfPlWULgKXkj18ueme1XtsJICForcgJA0GrwyAVlF1R
         yuTyy5BPvslhbtDJJ2aEUSH9j9IIikHkeouPu6v06cNuTT5GzkFugSzkYfmaCQosxbNG
         wixA==
X-Forwarded-Encrypted: i=1; AFNElJ8UhBElEH4cKD5dsxX07jX1xE9wGcLQgXfLwnY36Kp2Abj+nE9fil0BG4IHpcRLepGVOy4JfLPd+uUZ@vger.kernel.org
X-Gm-Message-State: AOJu0YxzJ9SeYGkzebXhmhr8qaXB035UKvb/niIkSzgboywBntEQfJKD
	RbsRXQ8eN7DA7iSl089PoASlfLGSFR3PpHY34wt0k9J2mZPnvUnTZs0Kmyvq4AIXLkk7tLiiFDA
	OGDA2Tklcs4XFjpbygK7Q0oi7JYX2HEzD8208MZJ5zTTu9n2WlwYyeKRcxfE/ldI1
X-Gm-Gg: Acq92OGqJbTLt9Z4qDqrDR3BFnvtMh6OJ4fqD4VXHPbO2dg5hCguCPQvmw9Fy3DuTOT
	Ug108NTEHna/atHdzYKhpgI5W5VnwLamJdyl4rHTBFV7f9ru+3eHCKyz/Omk5gjOmuwyfKuoK3L
	jf4bRt7/rKt1HtQU15DV85J9NEALO26CvrDWAGXn4CXx6RgujDZY0TZvC+50qbLKGdCE8QhsWMv
	FrYuVIzVptrRjebAQim6NJ7e7ktaY8Vqj16WezF97cI/p2oSV0dfQFHwgYcgjx5n0QojZNl5Z2S
	7Cevlcx4a04P0j6/2XYhAvt90aNFztFxhsocTJx97fpG4CAKU339+cgY5jKxFLrnMG9KPc87tEQ
	eYedYGNwi2je3oYhuYzIsvSaaxgprFNBGZQCcaPytmds=
X-Received: by 2002:a05:622a:4e85:b0:517:5e32:f3b6 with SMTP id d75a77b69052e-51795a24229mr240024781cf.24.1780989833533;
        Tue, 09 Jun 2026 00:23:53 -0700 (PDT)
X-Received: by 2002:a05:622a:4e85:b0:517:5e32:f3b6 with SMTP id d75a77b69052e-51795a24229mr240024491cf.24.1780989832986;
        Tue, 09 Jun 2026 00:23:52 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.7.18])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f351ac0sm106947297f8f.27.2026.06.09.00.23.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 00:23:52 -0700 (PDT)
Date: Tue, 9 Jun 2026 10:23:50 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <jesszhan0024@gmail.com>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 4/4] firmware: qcom: scm: Allow QSEECOM on Yoga Slim 7x
 Gen11
Message-ID: <iuxorxt5vp6nayxis4ec5n3qi2z3qlfpheaidqqj7ulshqt2b7@hrk2kf2vnqui>
References: <20260604-topic-yoga_submission-v1-0-57c70c23d0d6@oss.qualcomm.com>
 <20260604-topic-yoga_submission-v1-4-57c70c23d0d6@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260604-topic-yoga_submission-v1-4-57c70c23d0d6@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjA5MDA2OCBTYWx0ZWRfX9+raizdZK1ky
 fBIAUFHxv/Ah3/UBdsN+FjU0kF+Vpp5ZkFEeT5pcQXiszZf/f3dDtWsbxggQ6sGMT2XxaGwJPZq
 dNPSQ22lVSTPx5U3/UjfLnafn9dVLH4oemhdsAn18ugh+Fzs6dGprJjVDXPdKjN67MJLJvx7fcl
 ZfuXimQOQBkBgX9Ig2/GmJnOS4y0VVkIg+Rm7hi59iaR1qcpFESNMAzks0ijKplw7YIkqv3cEyo
 dMz12l090kB2YiEfFRgGl7hbcXFpOPk6YWXsG54vqO11LCxN6FvbFoNLrRXfKuItMs80mEBZYt9
 zdKI3sMu1ihQhLx2fC101vIoVFnQIDd6OUvQziIxehjD/yqdqMhyTtsG94CNk5LlLxW5SkE5vmO
 0dFMfVxYpDGS0ncbfLwzWtKbV1Dg/i6G0zUVA+mzi64uI4VyXqBEUqq8W2qtte85/4DXltGgpdk
 DAP0slBlh2XDmEM/SQw==
X-Proofpoint-ORIG-GUID: ZPTJsxi-auNTbXDoQkRRfGU1ZeoS9TRD
X-Proofpoint-GUID: ZPTJsxi-auNTbXDoQkRRfGU1ZeoS9TRD
X-Authority-Analysis: v=2.4 cv=Z7rc2nRA c=1 sm=1 tr=0 ts=6a27bf8a cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=BSZ3G9h0/EKbgBlQZBbU/w==:17
 a=kj9zAlcOel0A:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=RNZNEj0NQT9gpfWmR7IA:9 a=CjuIK1q_8ugA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-09_01,2026-06-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0
 clxscore=1015 impostorscore=0 lowpriorityscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605210000 definitions=main-2606090068

On 26-06-04 10:06:57, Konrad Dybcio wrote:
> Allow the use of QSEECOM on the Glymur-based Lenovo Yoga Slim 7x Gen11,
> as there seem to be no issues with the firmware that would mandate
> disabling it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
