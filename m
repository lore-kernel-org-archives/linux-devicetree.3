Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6983113FEE
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774781846; cv=none; b=HGeZZZGPQ+/7ACmP+6gsdQ7AIZhastLWGcupF156cTguAjCuJV49Pao1uc5nVEt6gZAbg9GqZbczv7ES+0S26ZmoGI46m+647UJ8fLQD2ofTLHMFcYgLyaMruiMxkec2cQICoAJW+dd3xPZL09P+2IBYfhyrsEGar06xvLOYbbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774781846; c=relaxed/simple;
	bh=d7PIfLIVz5R9AdcTPapjn5jjjBSMlfpUS6WPMkU2UAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jta5PR4HcLkaTRk3GCUdbXOEqwIX/g4sfWTzfzTowg1SmQSKZMlzdXF12bmvd7SoGWVVHfJr9YmD5Uy4awNLPBrndkRNzf8qR8nGhd3gQmdH+ZaXzlkf7Uy+nbxE8nr2RJfJbmm5NzSxz4Qi5qd4T+Q8LZS0ugMdWy1+gfa0xds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Lfuhz5AH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PJyrsUKL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Lfuhz5AH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PJyrsUKL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62TAj3qB2197293
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=jheJ4cNHojAtDFO3PbK2hLz3
	dhJvovobrNzqjnMu+e4=; b=Lfuhz5AHZhyPTyFngbXnBZV4JbU+kDbhLyJVmE0R
	+fzR9sPI8/W1tdhI9x1lNLSTzbqfozjDLrtHv9iG0gH3NdqSd8DOfqI89i2Y4jGm
	AYfONY/2ntsUO330yAEeCw/Vv6QW2qEMymi71euQqnUiRbx11Z45Wc1JGnPGFHSW
	c9rLuFzGrnJoO3BZIdc/vilNWlOFWhUiwoEkq6RSgW/5WXhUV+Jtrm/8JGojb+ny
	BAd/pmHSd1lrins/Sf42weOROFdAQKJWMYXg2qxMVPrXL/kvt7CtmfWDgh4rt/Sj
	2PKPxLj0M87vZoOBhcwyFiBxOFN/x7JwDw743E33IIvZlQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d6v9c0jkw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 10:57:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093025ffecso113102331cf.0
        for <devicetree@vger.kernel.org>; Sun, 29 Mar 2026 03:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774781844; x=1775386644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=jheJ4cNHojAtDFO3PbK2hLz3dhJvovobrNzqjnMu+e4=;
        b=PJyrsUKLZpGlEu47H5ZQKfBzgc7Oskp89amQDri1pw77UfKd8G3kYZb7UmMan9y+NX
         IQy/rhKPa+IUoqKUQlf64YfSDrBzfpDKZ/yRTb62iVn3MwRN0PmWHy9mmeOKwUWKLTJf
         EvhTfSEXHYwaX6u3IZnQx8MueVMLRurZWLzB/kO9QRtAwHNH4NX9ahnfwSO29esFeCLi
         BNYepnBwvVrf2W2iurjLPRfyX9BWcEhRAX5AEv8VXDz/chIwMLLW/nEBl1XAruLvu92b
         ALrDH6ORs9vf+pIi5NqfWnsIi3knQ0tKEiR3ie67U1pmfwoO3JAJsXYLPS6vRYWkYbMo
         J7xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774781844; x=1775386644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jheJ4cNHojAtDFO3PbK2hLz3dhJvovobrNzqjnMu+e4=;
        b=PFTUcOTsyv8N1nwpYZhvu8ltnuRoylvblnvajtiyd+8848gV5HeTpVW72Cn+OyLwaw
         t6J7ZcmI+xXT+mcc6SXkYqGjhOArhPsDRvUdOym5Inky551tWLMOFg8Itqr03y7PQDK2
         E7wG6iIRVPa5Zo2F3UanK861wn/tqtIlKQt4QMrxSqDFZc7A1NgsWRDEd15paUdWZUG5
         c7ftxilbryvq2FPL0sdGL+vqfUe59OlTLSd+M4Z7xdkmttvIUXqlot1N3EfbHZLCZvGa
         0aMDoCHMXvjg2Pto7c8BesRk5fTRiJGiTROtFQQDBUxUN4YSzQNmg+uA7vPLlqZm0DSu
         x1Rw==
X-Forwarded-Encrypted: i=1; AJvYcCXqYE3RBImesGQJU34x34knZvVBoElcp2K8vxjC+tSuazDrrZ+A6q2Do/Y5FbDDd2yMw1ILxgChdXuB@vger.kernel.org
X-Gm-Message-State: AOJu0YxIYLv9kFrvqL28Nr9XQFWoB4QkdCIA/Y8XjH1SzO+cOw7mGcI9
	CixUGxomaorZubPMUpKAGX3f2F6NTrZfoQrDNoZPcrmFF/PVf2u2IAKeENJc0aga+PhW8TAiG5E
	ZyK6Td0nOQmlevOB2NM5dZC+JZZzXFf4+3VqgQsLFdl2Qn504+hR+kEz9IHdTgNEW
X-Gm-Gg: ATEYQzwkpgplfE6r+MFyRiuR+HoLpCuo8bLMeplgKFyoW1KRI/uBO6E6pG3+IB4ZWy8
	XrwaxgGaP2pd7aEslwlkRK9v6+c7uQfR/JVaSU+pFxkc6il0MxtXArIFnudPH8JOndQS4BMA3Gq
	liLe4VHImZbMLKbJ75eyO5gupLHd6M83ZK2Gm+/e626mhnKzXM3vsznEdeU6dQr8wWeIfOQw2vu
	A2VjomjWDoN/zvgfskiuTcpMJBZ+F5jcJU8unaTzu5uXK7mkjJ/o8GkEe3q0mX+g95DmwNtltmm
	8cJHrJ+lyUza+1Jm9xZjZbLUMPfeBWdChIw/Ntem2zErY7QL2Kt8f2rgv8Q3jg8yMcJFDlSUbYo
	lt9gRkFOAFW0bxvQrRIWqRC+HTSsG6x6IrakI0rjCv8cvPstNgymaHS/NE4d/IDIhsJi6Af7fGm
	8dmo31bj+js6m/J7Des5NpcpzZMK5wrU+cgCs=
X-Received: by 2002:ac8:58cc:0:b0:509:cbc:127b with SMTP id d75a77b69052e-50ba39a9d7fmr123028861cf.60.1774781843824;
        Sun, 29 Mar 2026 03:57:23 -0700 (PDT)
X-Received: by 2002:ac8:58cc:0:b0:509:cbc:127b with SMTP id d75a77b69052e-50ba39a9d7fmr123028651cf.60.1774781843293;
        Sun, 29 Mar 2026 03:57:23 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2b145f145sm971588e87.78.2026.03.29.03.57.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 03:57:22 -0700 (PDT)
Date: Sun, 29 Mar 2026 13:57:20 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Gopikrishna Garmidi <gopikrishna.garmidi@oss.qualcomm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        sibi.sankar@oss.qualcomm.com, rajendra.nayak@oss.qualcomm.com
Subject: Re: [PATCH] arm64: dts: qcom: Move board nodes to common DTSI
Message-ID: <hc3bkodsdzq3to4aaax7vaeahhlrisk3iytuaxu46bjm37p75w@4e7c4a3gh3lb>
References: <20260326-glymur-mahua-common-nodes-v1-1-12bb26920ea4@oss.qualcomm.com>
 <03996c07-f9f3-4586-96ae-075927da2577@kernel.org>
 <83c78333-4db9-4943-b90f-164981bb68d8@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <83c78333-4db9-4943-b90f-164981bb68d8@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI5MDA4MiBTYWx0ZWRfX+8d519AiSR/w
 ycVemTvNcITRQdVBEkVMi5axIvkqJGNTh170YfTVm4j3nQCz4fzwXQD6KuOPem54EGHDCQfkLBW
 FC+EcwtRhJkDBG0n0JXu9K0F8S4vns361QVrEZs/ucbP3Vt5n38eqtZtSuGnkw4a0bUACTgVdlY
 g5VqbKuCH8dWM3Np6Z5ZNE6qBIaQWu7e3kwZbKwcEQDuYFW/48Hfmn4HnGk+u4YTxWqIPm1AE1K
 /5JrjpjZTU6FqKESYdypVEXPfoDAfxvOnBjnuF3diI2GHJAL3Izap5SYjXcxoP7bhgolNiWXSLf
 Q4VHeQCJBb+BVD5CS4fF3uRb91C90KCgzw4Zuzr44hpZ+iyd4W2i84emn9V1794DQBXSWNz48KN
 /gY/QB1FAgiSQHJTU+f22Lpb+6NXxfbk93YmESlJqqweysByxYgOBCz64QnfLiisjYjWngeCvNu
 K8jymc3zx5hhuRJIGFQ==
X-Authority-Analysis: v=2.4 cv=EIQLElZC c=1 sm=1 tr=0 ts=69c90594 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=DYwwgnFDFWkK_D0auaoA:9
 a=CjuIK1q_8ugA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: TgZl0nXKAwWXhM76sqv1QeTROJMyq-zR
X-Proofpoint-ORIG-GUID: TgZl0nXKAwWXhM76sqv1QeTROJMyq-zR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-29_02,2026-03-28_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0 adultscore=0
 phishscore=0 spamscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603290082

On Fri, Mar 27, 2026 at 06:16:59PM +0530, Gopikrishna Garmidi wrote:
> 
> 
> On 3/26/2026 7:55 PM, Krzysztof Kozlowski wrote:
> > On 26/03/2026 15:21, Gopikrishna Garmidi wrote:
> > > The display, peripherals (touchpad/touchscreen/keypad), usb and their
> > > dependent device nodes are common to both Glymur and Mahua CRDs,
> > > so move them from glymur-crd.dts to glymur-crd.dtsi to enable code
> > > reuse.
> > > 
> > 
> > Same questions as for earlier tries (why this has to be repeated?), e.g.
> > x1-crd: Please describe here what is the actual common hardware. In
> > terms of physical hardware, not what you want to share.
> > 
> 
> Hi krzysztof,
> 
> Thanks for the review,
> 
> Will update the commit message in the next re-spin.

Before you respin, you can actually respond to the question. Do Glymur
and Mahua CRD actually share those devices (in case of USB that would
mean having the same baseboard with different SoCs being wired) or is it
just "oh, this looks similar enough, let's create a common file".

-- 
With best wishes
Dmitry
