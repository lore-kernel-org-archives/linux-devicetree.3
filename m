Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23D301D130E
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774408736; cv=none; b=CO0mAJ30qTItKRUT/D+H+QT3JgDYNn+0kRVUkXhXP6ywN5eXiX6JgGOlus7WAxp5vYLEPlssAUz7dWlESluZlgnK0AHNY41R7sg4tNGn+o0qRoKbGGfwb8vEbX/pCXTHW5Dv+uT/+P1ZjWxePqA+LSps5j0OKuMC35nuqK7RQ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774408736; c=relaxed/simple;
	bh=L/fbNuXjYn7XsRJDxzHI5vUb2BDiq7dkEs8JRNhYZVQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AKMeZ7xP3lpPPV3MIbGvHCUmcPTj5J227ouQF+xgyCBt+VLQTYAwFh4Vl4scG6gAyqDaQFoXpiD+XXMIjJE8VMddsqBfckZsbdIgrYdibbBjMkKhYwcPSTDSJfur0O0WaEZ4BjJ/BYBd08R+BVm7NAmJE13RBf7ShOnZ1tJLIJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GxglNcNT; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MHsIKnbi; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GxglNcNT";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MHsIKnbi"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OJD7dM3731423
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=P3t6OHpAQZ7WZMhx/RTKrRQz
	SrkeOVJeFRjxYYk/5QI=; b=GxglNcNTlqJeMYdS8Tu762wM2Ojiqd4nLyFk04EV
	4a4Ts2rRjdzMvtdjWM7BefspqKHONLySSBIBaki9ZZpES2vDA70hdTzxk1jKtNqo
	kPTDIld8GgO7Z/Pv7/gUSQde8txTPJvmMPWAGuavF5qSQy5Ht+qROEqxmW7hPETi
	HipfrTNFywYLTMVf9TfKV4Qzct8qXL6i2Um7EVvwqfsFY7e09QZ5rQaAqPB/d92u
	AzZXBYLD4JjIZezc+CNGDer1qK8rmFM5onm5BXtnbbD3XKPzWMoLyI4LIsGNtgKA
	+7/Rq4hF8DAZyq3BREw+0JPDI/afsoYewwiIRvnMpexY8w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3qkeur2f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 25 Mar 2026 03:18:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5093b92f327so419759951cf.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 20:18:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774408733; x=1775013533; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=P3t6OHpAQZ7WZMhx/RTKrRQzSrkeOVJeFRjxYYk/5QI=;
        b=MHsIKnbi96Cjp3SHvvvXuJjsNypcmCDXfyGlSIQAq34u2XFuqS4C7+ISvtkOJbJSJT
         nHuIqCdrtpzGtQfpdvK0/+SlnWmALhyFPBjZ8U+yIUvoSH9DURohhxN5W/R8pV4WtCXW
         IOZp54brI4HDlHSLMAW+C8/3vKQSqZ7A5R/CH5+s4++hVIBlTntPIfWfK4uWR/xj6tIM
         pn4MSMew4npfIXcfS1SqJgE5469SdztAyAmYz8xoQyLp7M8boFgsF0Y3XKmG5J+jS+Cp
         XPx2XOO58BxML3s5sUqNiGx/CyumWlJSSYeUWftSF+i7ML8s85g+pzYG4AD0Jv5rqK2e
         4B3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774408734; x=1775013534;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=P3t6OHpAQZ7WZMhx/RTKrRQzSrkeOVJeFRjxYYk/5QI=;
        b=ijp0l4cSxyLQf/gauS71u07pfN5OAntdtunRpSKkmsD2DzwpANqHslXtxBnyuGg1FI
         URYsCTdg1F+oi04ZhlwqbDdFKX1NBKbl5bpf/idmyBMlP4hFdLLY4f9dCyZngMtIFAwT
         gMCBCNgsArdfk91LT9SJNrCTlUigjy7KUoAKI1unmpWN2dI0epO8QM/KnkjRW8Mdq3aS
         qaSMmVUNQbthP7xLSABzJ8KeNQ6tyENaW5Q2DOCaoIOTH86rn/YiscW1dHmUKMj8/4TH
         I8TC4QSk3AVuAU+YBH9jtdG6rbqlKqvfKu0DpdqGbX/CGyrp2WUZcMwgPKVod7zraqa9
         vlrQ==
X-Forwarded-Encrypted: i=1; AJvYcCVa0vf7Rg9j/9cJkWt5GrRRv9MgIGIaSAcHWw3EATf8u7SXUGD6TRZn7J8vVzuOFaA2ZQe3x95Blnon@vger.kernel.org
X-Gm-Message-State: AOJu0YxWFG+Q/4BWa+yMRQSQ0C+y0S8/8JzYXdEzuNrc9AX7B6pI5JGO
	0FGlGdtsVaGFg6irrleiByLQHkiJrr+zK71TPH9vBPPomKCFk1BdKoGbzX/flCi3aN7xpqVKBdE
	rzhc5awAjPrAvTru9RE9trGCDw3qNLWulvSRhK9a3xvt0okpQohHTyIla3l/hkiTM
X-Gm-Gg: ATEYQzzAY9CJJlqcSNDgXywtXBW6qXhVKlXCnYdoyuTNXyEaGqBMsMi+O0BDrklUWc+
	7dYQI+WMm702N+lLsAO49UmBP6tM7MMhKKaoIUwToIPthIkEb1dq6dRuvDe5xvIzHJXNJDarwBL
	f5AS1VxBwAQlvgc3DVtSgq0oe7JxAFELcnhEvwfnLPVNIcw0ZvbXQe1uEkG1ikX0AYCCrzSD0d3
	RH/j1nxIsM/FcNTfyAfi1u6NGwoYyeFs3HlJrlKzctuRpz7gzEw+BF/tbK43W0fP43TC0yTZe86
	WWTuaIa6+2xudnqrCI8uMfEQevGS8xQNryZPlkbpDuRz7l45fcEQ8EwWgNNOL6pTrkNd3kon+Ik
	oKxeruqK2gF0/n3IFmISoqtjdklf2C9uja5ttuowyVsiUOekAiIMlP3asHvvKo5WqArv4D9rmSz
	DvlbS6wbDJgw03zu82TebYKcjIqRhx+3U0DA4=
X-Received: by 2002:a05:622a:1486:b0:50b:4001:ae12 with SMTP id d75a77b69052e-50b80e0a275mr31300001cf.46.1774408733571;
        Tue, 24 Mar 2026 20:18:53 -0700 (PDT)
X-Received: by 2002:a05:622a:1486:b0:50b:4001:ae12 with SMTP id d75a77b69052e-50b80e0a275mr31299811cf.46.1774408733116;
        Tue, 24 Mar 2026 20:18:53 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38bf960dcfasm37894941fa.0.2026.03.24.20.18.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 20:18:49 -0700 (PDT)
Date: Wed, 25 Mar 2026 05:18:46 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Paul Sajna <sajattack@postmarketos.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, David Heidelberg <david@ixit.cz>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Amir Dahan <system64fumo@tuta.io>,
        Christopher Brown <crispybrown@gmail.com>
Subject: Re: [PATCH v6 09/15] arm64: dts: qcom: sdm845-lg-judyln: Add
 firmware nodes, change path
Message-ID: <eczuhmxgclyc6p5vj2e3vtexm4n25mpjkfinqyx6wb7yeddcco@thahz4f5lmhg>
References: <20260323-judyln-dts-v6-0-29d70ca1651c@postmarketos.org>
 <20260323-judyln-dts-v6-9-29d70ca1651c@postmarketos.org>
 <4rafi4dc7dqlcracrowkpznelezu2bg4fcwur6vsm332jcmxx5@uhno7k3xv5jq>
 <e5797ee2d4e6b6a0afd279a8943d5f63deb9dda1@postmarketos.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e5797ee2d4e6b6a0afd279a8943d5f63deb9dda1@postmarketos.org>
X-Proofpoint-GUID: zN6g65vUg_8K8mrpSmHfwDbs_ltNN2Xt
X-Proofpoint-ORIG-GUID: zN6g65vUg_8K8mrpSmHfwDbs_ltNN2Xt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI1MDAyMSBTYWx0ZWRfXyob7ybrIq4ss
 8r7VIPuCCRCqV9K79PDyDSPu4qdhIFmwE1eqCroxsUZHC0PP3qAJMkOQWl7PwwJtv35iBpyJNZc
 HE8syqyy7WSy7xhS0N7wWbF3odUS6DZUHYmr+AIJDfbSgapAifcq6wT82bjhcoNwGA/Z8E1WA1w
 fb+l5fpshk/NTbPW5Ti8IDulPAFwtD8xoOJN+/hTZYioP8zgEcPT4uRcbw78F/EdTP/U0QktRLC
 ZhCX3SulZySudVgPeLLijmylpJlC5RWGyS87YyhHqpeSoEHCAl7Ts8Xu+i1WjZ+ERHpWDO9YgmO
 XwNkfYPkcKt9OiUfQOhEcugQUpz/CNxhbz+CXrk8a0nF3+k1Md7Uv9DsZHI5gTpyz/7rlXFSWPK
 wfF6vWLVMmrIbo4Nr87A3Mjsj4ct1ZL28UElwI9lIGD22/QGFwQC9eE16hMvMxKe0W4bOeoGKlQ
 pzG9hFPEkk2Zis6OqKg==
X-Authority-Analysis: v=2.4 cv=Veb6/Vp9 c=1 sm=1 tr=0 ts=69c3541e cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=q8gErFrpIn0Q9GUK0HgA:9 a=lqcHg5cX4UMA:10 a=CjuIK1q_8ugA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-25_01,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603250021

On Wed, Mar 25, 2026 at 02:03:47AM +0000, Paul Sajna wrote:
> March 24, 2026 at 8:56 PM, "Dmitry Baryshkov" <dmitry.baryshkov@oss.qualcomm.com mailto:dmitry.baryshkov@oss.qualcomm.com?to=%22Dmitry%20Baryshkov%22%20%3Cdmitry.baryshkov%40oss.qualcomm.com%3E > wrote:
> 
> 
> > >  &ipa {
> > >  qcom,gsi-loader = "modem";
> > >  + memory-region = <&ipa_fw_mem>;
> > >  +
> > >  status = "okay";
> > >  };
> > > 
> > This looks like a separate fix.
> 
> Should I put it in the gsi-loader commit, or keep it completely separate?

I think, together. 


-- 
With best wishes
Dmitry
