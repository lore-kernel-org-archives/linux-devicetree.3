Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BDA3F58E1
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:44:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787222684; cv=none; b=SsiILhWXjddH0HxrwMhDSNJxT9T/gzg9580O1iwCqSAZtUyK+Xxeu2MB19fCc62mSEcv3Yz+nck19Qu/UjqSJbXVAiqzNXk8fpH+BNk6Ww4Yl616XGjg117jo1AxbFdwIm4HPV7TyWoOsEicOaZDcJZ5+IXM3aKZBu8anrw6kzY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787222684; c=relaxed/simple;
	bh=uS8R5k5DUGiB4RWFV7NfecEY2W+Azrnzk3zjDdpSSFw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nS8iHlFHJASZ9vnxNEKo8qJyeUy+NV/rIDi3a9b/d1FKdfw7H7FopPyltu+AgFVwhqmEURfuAwPaWUdcBXSgqMeEemCf6XdbhOATPCem5/z2unj/LU+FlXpJ2wxfmqkpK3dol0pyHz4nx8owK5DRJ4FvWq6wiUuguZTjnGUSy1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=chpmrH1U; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=GMWA6vA2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="chpmrH1U";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GMWA6vA2"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67K7LJDY2753193
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:44:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=OnVSx7Tmcw12tDoP4W0bdH7G
	FQGNd8NMsnrM84MuWbA=; b=chpmrH1UlJLPi8+zPDzW7svC+/o/M2gvCkEkbIo2
	W+DA8I4kUjkQE7N3etbs1O6e452zJDUzz1f2l5nG1/BmgRH1eFUKZ8LT0bKHvQrB
	mpULbt6own7cUNPEqeB3M/v46knhHCuSX/CWSX/ZTd69q+uQ14QhKYIl3jTN/9Xt
	Qz9osy/BxUXtENBL9WAv2bvkhKrTwHIiIsctWfpEb0Xe2wlpYz13Ysb2GDutrE64
	3LMiE3BCjZfSA63U2xmBMRBCPbeqgyJsF9hAF9eKuZP3ZL4j8caS1lYrrDTTy+Si
	PV0gsUD7aEALS1qc6oUhzViJCft+dUgO1iM4XB2OH1XvbA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g5w498sh8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 10:44:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930a098ea19so315075785a.1
        for <devicetree@vger.kernel.org>; Thu, 20 Aug 2026 03:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787222682; x=1787827482; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OnVSx7Tmcw12tDoP4W0bdH7GFQGNd8NMsnrM84MuWbA=;
        b=GMWA6vA2gqgB/dcY20ihgjOhmNxdUke8YsUAMaAryPCTZiGG8+J6NMNgv5MNfWO0C3
         AerefPJajLIgmzRbAMzIF2SHJHPnKfGqn5nJObgo8eb4ZhCl6o0sxaBAutFi/1UQiTZw
         RNpz8suIkl0IIGdQzyDfXuO5TL/BqiMycaypxuqNirARVKbLk83DRamNr/7NDZ+7SyZX
         wv5s+of4f7Lvtj2O974L5EOTq4UswU2hcM3fStdhXsgSY7uDBc0waSrFQ4/XM6ZMAqrg
         edzJ+6o6lBrE2UZJYq6qagpQW4NwIkM31D2gDeAlVcaqfUpOCh2rImPziZECb6drqrJ2
         Vxig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787222682; x=1787827482;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OnVSx7Tmcw12tDoP4W0bdH7GFQGNd8NMsnrM84MuWbA=;
        b=OOBo5Tr7q6lo2Hvk/T9rfwavy9KMOLwsG2zuJQG7K2wxiBaSgCfmXiUuCgYHRQ3DeN
         fbwG9m5wsmUfH5cJ9oUqdv2VfyQfXlgFS9dfmmU1FCJtB7MMjlLG33G3fvkJlOLN21xl
         h0hud6IzPyE/hl2YfGKSeoo45Uc7C7J8N4sckq22IgQtexPDkDnRdm47AcWR2pVFyVEw
         SUA3MeHjWlxdg+CIYUoWKs7HXu9yiuQyfYtQSG+wIxR+jUlW+cRMmxegC0dATs6K8Dud
         1B2GlaK6FKb0Wyoj8Xzxu7tVx7NW/ghr5lE93U1LrSO//9oRrp5QaZx7nAcCldx48q1z
         P5cQ==
X-Forwarded-Encrypted: i=1; AHgh+RrmhVFx2uySd9fXdtszxReG7V3l3rifAT7l4FPQ+WZ75pT1p9CqzHQB2/zPw1cpoKB5MD+1JXj3hcJ9@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj3Zyrb1fjoE1M5EhIdmzArBvC7OBLt+0Yn4g5DSe2JhTcM+yI
	uHi53i0rjTXny64ZWLuXSDgiKoMNZ+6e18Iov++4Msk6CgSGP1YNNawcii0Ps+YvJQ/cqBt8auI
	ryfIjwixxuvSpe86NC11xqLqrCm9kmXNrY+kQ8YQfNxIgN6zWBzYut6wcX9qRaBlQ
X-Gm-Gg: AR+sD12Bsb0VWn7KcZNX+UGnwdSjDupb7JENOS2+YzSDc7V0ruG5icHEfB5miZEGEyr
	8FvCxpC0UIwdamGaRvu0P/MfjRhqdBudg3D13ViYC72McBcLswC0mpN/3/FLNY1/aH0ck/bJIfV
	wQJGamrjdf2M9+MoQnuDCdAtBrSBhoTeDgDapNDLxIBaVXC9Lj+w+QYci8yIEimIvevJz9S/dlR
	sLqWkT3sj56PlAGecMa2E7uc6u3imYBkREmZshj2JcU93osNh6Kpf/3jQcVmcpv4J8nitjBfF6y
	HuZIo0SC+KEzoMVyrwgWfOnBUJDlytgdQXYO4Cq3NkJVuBXElzPoRyJhtI4Xx3idANmqoNsLi7z
	Rh/4stjXxWe4CsS4=
X-Received: by 2002:a05:620a:4886:b0:92e:76a1:96d3 with SMTP id af79cd13be357-9371e6ee8b7mr956447185a.34.1787222681641;
        Thu, 20 Aug 2026 03:44:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4886:b0:92e:76a1:96d3 with SMTP id af79cd13be357-9371e6ee8b7mr956443085a.34.1787222681097;
        Thu, 20 Aug 2026 03:44:41 -0700 (PDT)
Received: from oss.qualcomm.com ([188.27.161.240])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482b14b8050sm12781171f8f.19.2026.08.20.03.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Aug 2026 03:44:39 -0700 (PDT)
Date: Thu, 20 Aug 2026 13:44:37 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Tengfei Fan <tengfei.fan@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 00/16] clk: qcom: Tie CX power domains to GCCs
Message-ID: <brgyntyrzxkjoptxxanjwhrs5bku63pvp3mubooecurwcpg56u@ctymopqzu5he>
References: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820-qcom-tie-cx-to-gcc-v2-0-e67ea30d8b7b@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX+wW3mYfCu9l0
 E2ZLginpePnX+BESl7CU3IYq1Kt5fT2DfGiCK3exX/sPv+FvjQ0PgVQZlZaO7jytbF7JWBdoALc
 tShp59NFAJclas8jf9HfAik95XqoqB0=
X-Authority-Analysis: v=2.4 cv=YP+vDxGx c=1 sm=1 tr=0 ts=6a86da9a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=wUpz7uCjLrEXi01cjX+DLw==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=N2DKuxuA7Gt9lniwrZkA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: IVfFcd2K-DBfb4yTKB6C60Ja0GkAGUkI
X-Proofpoint-GUID: IVfFcd2K-DBfb4yTKB6C60Ja0GkAGUkI
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODIwMDA3OSBTYWx0ZWRfX4OcQH5T3f7mK
 DBkMqBHHuSHlAUDKeOJgY11R6atnVzcTtSRpi3E5lNcrU4O82cKVmR3vbX6h+b+z69FO8U4Ig6Z
 mOVfUUoKTxJDd/0nnvFfCG02xelOzsy54L1bwKDRutU/CUdy2d/MTjZMyomQ5EOo+XxgFC41xvc
 mgY57iPqSy2m9al+XET9y2bRb6pnXgRo7+41hbQ17VY3yJeHPY7/o7r9XOsyhMc93DZ2H1EGJSZ
 VEqy4pJB8CU+Vnvl+3oBoIji9PLLuD6WdCT+HBsbZ1H8ThVxAv0ssxlZA5jmBlXS6VC2I3VGp7Z
 +mWVZ2/LRpxOJL04wgmXRQ8wOx9JmTtB1Y7W3R6PNxZaVfskdf1S/pyGGzuWI9iw6C1UqHfD0Pj
 rBfhzrCLKhf31tXMFn6XOn49/SFAblTTcuRRWDhU/k0Vqq00GunPXoyoR+osL9agseTERrb9iOp
 v4ICSJtWAw1KXenOkZQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-19_06,2026-08-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608200079

On 26-08-20 13:07:03, Abel Vesa wrote:
> Tie the CX power domain to GCC clock controller for SM8250, SM8350,
> SM8450, SM8550, SM8650, SM8750, Kaanapali, and QCS615.
> 
> Also enable the runtime PM in each of the GCC provider drivers.
> 
> The existing common GCC schema accepts the standard power-domains property,
> so the bindings require no update.

Argh, this is actually incorrect.

Bindings need updating.

Will respin.
