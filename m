Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4CB493D41
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789992407; cv=none; b=m1L3wF/JXlTzNZG+hMy1fKFWdt/z3SeB6noRW9qz1tiRkp0YnH2Ov48y+kqDgEn+fuOkQRvAD4WSAMcHxZYbERtoY0bNlWfOypDZjhHzsZyVf+Oxb9mc5UJqvmnEarLIBOTS0pwK6IatH2Lvigq+Lc7mSfKnw4jvSyt5noaE+QI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789992407; c=relaxed/simple;
	bh=8y7/zMoAU5J83AFr8Wyv1UTO4I735JbfICWLuS7AJ38=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LIapmUwBf8oPak+lgK7PRnZL0i59EPHev7i9KSMjpnMsfX3O13rXycyXolApKYJ00LAyyfOxlKTWA+j/vywCDDmdHtq5Gh6ZODYzn8pJfCmgy9861GwFPP6dgOa6SJiFf0wmy6dF+kbEvH8B2HWcUxgMv07sjoE3G8yCkDejef0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jY7FEHMH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=awXAjIJg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jY7FEHMH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="awXAjIJg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68LAeBrZ837829
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:06:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sXBRdDppBAPCJg9q01FQoe64
	56Ok5dkROCyGIu6mvo8=; b=jY7FEHMHa4U5+m/pn8RZKDGeIRm2gvbq9RvFWkrQ
	0tL3oM2j7JoLkqLp4VCfGn5TTOo7ZYBMqF0sZw6t23msrINtSQo0MC2asvJZ2WBi
	1pJEThWv7Q+xq/083llZ8gDAIYLVpUHufo5mtmjOa6NRdHMttuIHymKtIFAsprG0
	0P9A6y8VStBGGu2aRXrfr2IQ1dH7QRA+I/xAdFwoV/43ADSUGORUTAZRXtavpZpT
	ljabt8l7RHduw/5X2iYa1QIUyn7R5WcvT7rOAx3x9Bh3eyDZrTrOhZAZ3/VRGAvp
	l4Bypa2IyS+u1pevZHakPIlvam913mON8T36LmI37QMhTQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gtwf5hq92-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 12:06:44 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7a532e31dadso2702921137.1
        for <devicetree@vger.kernel.org>; Mon, 21 Sep 2026 05:06:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789992403; x=1790597203; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sXBRdDppBAPCJg9q01FQoe6456Ok5dkROCyGIu6mvo8=;
        b=awXAjIJg8HkMsHPROe95CkeKtXoh23ce3G50kcQJXTu2Ai9x9gX3Kr1Yzoe/cbZhb8
         sodXa9LBcrL2pHEVR3P8A7Tk7PzMv3GNQlQBMHNBqjabnSbuXMfxKunuhVPv8bq8hDE5
         qNVVTeoLyapwtaWepycAQjHjIau/3EATj4VxWu5u6KFNGwzq9SG6zl+i8wTJmadv82w2
         ALY8qEpctPNDsSAhBHJiNcDEGzm6kk5OqWlhIVQuKs3DKDSSxPkBe32H705lfrUVIisR
         RcIc4zbavGSOEo1kLDAX8pjyNn0nIAyk+MFBCh+QeZ6vUfPB2hz9R7VHXgDB/5SOKJNS
         0VaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789992403; x=1790597203;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sXBRdDppBAPCJg9q01FQoe6456Ok5dkROCyGIu6mvo8=;
        b=bs6prGby5yFC9Sp8h0zp9vvs1ZSK0sJMmnGNAfX+dRRa4JrCdrgtFAYUJC14ct+9MZ
         lU4APHjr/HhGAR8cOp6dyiIqqkeMHhtiYBI4IYMytXYeEtnehDecF1zv2c+spMcs3bhg
         FiyBypOYNuwnfUY+RRznOlcFyIo7lrZhjpINONgAMCW+F7/SD6MlgtqbgRvLykoR1xkw
         +qps13+vWpMVyxInQpNgy1PyO+aA6/QN2ND002FbWbdVkIdRZp57BrVH6VAWHZB2OWvB
         5CqGFvFCpcBOREZ2W754Tq78Ikiq1kEYk3mftwxn6VD14sQ5Lmqt9/aJG0LiYjQBfgH5
         lA5Q==
X-Forwarded-Encrypted: i=1; AKwUvBz1zBFi+ai1BWE/p9NXRe6Azq5fmxiv0y3RV/4pQ0MnHQnx53YZ3d0EeoJ1IucI6ZoMlRWB47cLq4mb@vger.kernel.org
X-Gm-Message-State: AFuF++nMZcZKCPqc8bW3gXK0pLv4ZWd0MoFZNTUeWYmynQpPGrG/RljB
	7dp7PfFY14gqzxkTTKLhITEPNG/viidRLPMmOsPAK2nE1QsO6UfeMNd4jWNs3/HgilvkHfL20qn
	9RyN9/xWHRGP9bNd7AukFE/sElyXay6c9tVPt7wdhti+C0YYMXlvisS6M9jPje9ot
X-Gm-Gg: AYBFou2DkYnZqllo3/7TL+camiwbjktRlKkdLS+R7o7R/t6M2l0MZaEpyaeGHU/QkWN
	eJPzCKUXA87BRn/lbGzNGayudM5NIBRh1/UevWI5YEaqbdCxVn44bfHukCfo4+JQyGlYdxzTmze
	dY6/fknj325ql8gFt9B+JEQPoTvjfynpks3PNB83uF5fet67AXkd+xuLq4LPOEHUAPbii+CLqAt
	xOT1SBI8t2zGqqClI8WYhubM6L6yRJsM+HQfV4FsJIGcplJHJc23ZLYfUw1YWJJpk+dPO83BSVO
	sTm+J4cmADjZdVEeNJyHzSmWkEoU3EyMLbnXNhCBsxMt9rxmdwd1s0gCDQ7Z7BRBYG/++7/Jdm2
	CyoFIJcPYyVyjSYQ=
X-Received: by 2002:a05:6102:578f:b0:7a6:a24e:811f with SMTP id ada2fe7eead31-7a6a25dcbf7mr2563246137.7.1789992403339;
        Mon, 21 Sep 2026 05:06:43 -0700 (PDT)
X-Received: by 2002:a05:6102:578f:b0:7a6:a24e:811f with SMTP id ada2fe7eead31-7a6a25dcbf7mr2563185137.7.1789992402738;
        Mon, 21 Sep 2026 05:06:42 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fcd115d78sm218942615e9.14.2026.09.21.05.06.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 05:06:41 -0700 (PDT)
Date: Mon, 21 Sep 2026 15:06:39 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
        Sricharan Ramabadhran <quic_srichara@quicinc.com>,
        Kathiravan T <quic_kathirav@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH 10/11] clk: qcom: gcc-ipq5210: add UNIPHY XPCS reset
 entries
Message-ID: <itryi53qwodsqngkeck2ev7hrzg5udg4phmxraicmwngwhpndg@4nqxbftjy75b>
References: <20260921-ipq_clk_changes-v1-0-d242e3d49648@oss.qualcomm.com>
 <20260921-ipq_clk_changes-v1-10-d242e3d49648@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260921-ipq_clk_changes-v1-10-d242e3d49648@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=SJLXx+vH c=1 sm=1 tr=0 ts=6ab11dd4 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=po8fGBi+ks8MzcVQGuqtFQ==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=22JUz5MsYadeaJqTxQMA:9 a=CjuIK1q_8ugA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: Jj0FZgt5WmNHDqf_mFK0kqFJFkhJtMGL
X-Proofpoint-ORIG-GUID: Jj0FZgt5WmNHDqf_mFK0kqFJFkhJtMGL
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX8N/Tlp2JTN1T
 RfpbFvLE4IHsWwsUh1CAYzyHsadL2ZoihimbTN+YbfP3eTsGLe9zIF7IMLV3g1uLhglPLgdtqSO
 bevRg8zldXlA50uJP8bYmiDGvoctPb8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDE3NSBTYWx0ZWRfX7x4m3yWFaPIW
 F2lFVmNaLIGoDcgRAF4KIrZqbspSu0JuOjAPjUUsMGEdooJagxF6izCwsygvKWZTPG8wA+rsVlw
 g7hXe09OLMi8F5Um7FBMhUsn6X7hCGycDxa7at4eCOZvDKEyrNAtFF43S0TRfPKAkHcEB9w9MxL
 jNOEI6Vp6IUwJI1TCKCiYVOdj0OV4/LCAmHLVP23zk2ohRvHAOCphXucs5+DaIEmqjNIa7taHOv
 98t65QE9YU7Sj6gJ00Rh75/aUPh2t7bxVX/w1XnlTL0sAFrUhLLakPJbVco1SOiJG/IEpQKzmkR
 FvPKTVkFR8OT1L0P9tz+3dNbS6EUf04qyK2+XC4z5UX6gTmYZDuhDNSQG17ZIelB886hlY9is0x
 miVk7jgnVrJqWvHEExeNsj8Bw+YalE6RP1jU0U42NKJGZMPyV4uRjdkziHSBGIO/nayxFyAaldj
 3rZ1r2skWSKkeXNRfcQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_04,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 suspectscore=0
 malwarescore=0 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609210175

On 26-09-21 11:49:43, Kathiravan Thirumoorthy wrote:
> Add reset entries for the UNIPHY0, UNIPHY1, and UNIPHY2 XPCS blocks.
> These resets are required by the NSS block for proper operation.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
