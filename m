Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 768F444AB7D
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784701308; cv=none; b=QhjMh0WjxYDdvcOoOmuB/lwkGNqeOAK9JvpoQXCLlL8ajc7TaIdZ+NAxlsTNJ/frmSXlzYG3v2nvoQ89BzrvxcCNC5zozy4ZTTYulKV7PUymWDiuvNzzcdE3aZ8gi3AQkBUk0qutB03GBK17uHbn5lmtH/Qw1D1MVUhSmzneGbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784701308; c=relaxed/simple;
	bh=0OXxP6sf26lNs2V3qfnLABobtN42cteBFXTKE+NyddI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eNUfdmBoZy6fMpY1BLeSXkxpToBHzGXEc++1HYusMVSdUtOEYggUVFuwusMIiOh3l8GsVCmT7dOaB2a9IK/s0Itzb+oohFIPZ8lE8tejXF0zDySTSFWKNZw4uZBv6qBzO4SkfLLJqKbFamJY/zDheJghZTcI19PH8YvDnWh3YO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RK++QXHB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=evuPY6HK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RK++QXHB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="evuPY6HK"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M53o4d3473784
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:21:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=fSR8cxfbjrDx5wDPjTiMdNNv
	rDDTqrjKaq1jOYu++oA=; b=RK++QXHBsod7F31zM41VJPW78anuEcvrhF9O9fda
	yr5w2RpkHjW93SkEJrr9oP39eedSRjI5y8UFilCSj8cGYFnS6tJ29cgVqJYTCelK
	fLpREq/iVKLchLvhlN3v0rRhg3af2w2YHziL485e4tOnAX0q0Y5F58TkEs5apiev
	Cp8BTulgIFLi02fimCPpe7s5as9/5y0v9Taz7YCHoX3e6gbhPtsJ07OGjjGRBKeI
	x1u4e3FhprEvt5qOGFFAs3pNTLuPt2rW+MbjcFutTkmwffTva545YVGQXLTEFn3Q
	+QuDeZDvKej+5xYFSfG1OuHMW+rRVeoESibDqdt7x14sMw==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjd6ftjc5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 22 Jul 2026 06:21:46 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-8f0f45415cfso206687436d6.2
        for <devicetree@vger.kernel.org>; Tue, 21 Jul 2026 23:21:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784701305; x=1785306105; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fSR8cxfbjrDx5wDPjTiMdNNvrDDTqrjKaq1jOYu++oA=;
        b=evuPY6HKMnfPs0PrFU9noCHxtj8TVrfJB1qDxqEhoJrSWqpwd1q0uGIL971fFCLS73
         ltB/iK72WIDTQxlqAKFN+Zefkt1ipoa38Tx0SxmU3Xyw/ESLOqgp1ZomKdM9sYhCLiKK
         wSuBew+kwUxsuiuMdPSSnF8puzTkmCqLvY5CRbfEHxRTeZ+j6Pj8Kx7D5QWIwgokyqgH
         JN+99yiywskZ+0kMthpoIwOYnp8tYxpHboqkepq9TyCID0wjSk6QRi2hVc1fJlihaDYz
         Dw96EkvXZwYFcOnf17jKzUkL1ECm1zusGPNE77g3EultBmkQZKCwVbMFcTd/B1dUzEqg
         W0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784701305; x=1785306105;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fSR8cxfbjrDx5wDPjTiMdNNvrDDTqrjKaq1jOYu++oA=;
        b=IR5vgIpoBwyBV2FvEChjROmxLLGtzetd/5V+WtJZsNhWbudFEM8Kg0LmpqwCAhPgOf
         84ZAkc7Ttf7u8EtCU3jB3N8qibaRSyptxRSHgi2Sh0N4F93HhD04PlKWWtReNjS+dMAK
         3+50MMGi1tm86GDDE1Gh0RXKK0Bpd7U00+OhZpsI2QZRuU6mgaYodPSocDMp1xsF6me+
         N+4hV71g15yl8qkdt5qa9MklCt1ieULcC+euy7IVr8vsrKG2ka33GPwNBccQ3vFTo5k5
         ofe6TzonX8bFOFI0AJgss7xPsbJ5W9wb6exfNocRK72Ik8heyYc3HNzdoLikbMXlKtXX
         t8Nw==
X-Forwarded-Encrypted: i=1; AHgh+RpLdDCjSJYCoK3cngriuYG5ZmGFCKYS9Drnj2C0sX50kSWshYTkWCPgeULVJ5lhZeGJaEx53qn63Ksr@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3jk7VkDltqEs1nfSWHNIug3Yg8/wkU7UFpVXmxVjCK3cNxuYo
	f3OhXU4jhCl4+yK/YxmvvlDANKXTpvSkFi9U0rL+3UA6daQAaxfY4UN/K9YC01XROC0k8sB95WZ
	CAOO/Z7ctWW7yvAR0GP2luwU42nAEbth3ufqm0RvraI9ubGR6NPQ6rj+v0WErm5dY
X-Gm-Gg: AR+sD10JGVKi3/fyWIutSDMnp4GteEk9pW/j1qm11Wsj5uSWewby1JBvxll8sNsbcHx
	o1VsRoY2P4qtN7AFjRBrogTo7GP2wMgKWMmzYdSCn6Q8LB747i+6KMq+ax23CSEfvuaTX8y4q3l
	9uVSdb+nFCqZsD0T61aKnDcLbHJw6cBRGRZeqpv+5bm2/iG+6gfHrmeZiqMLpHEIA6xKl3psw6E
	wPIcEP7zl2PJ6rkFpb/07h32J7zLzNNUqnOtwfAJwpOShCrJnES3zKl0o2mO2IC99vIpaDNXRms
	ApldCYCjv83MSGV8xQWdtdPKW3B+8aQCjQHXsK+DIDseuoST1QCrRxVBuKNNdl+3Kj9nJux+ddp
	6aFWXHDsMFuRH6CSFiLcTxBUQKOUCJs3gQ829Vp6al2gdhs0AVInhWrDFetm+y5gB9BYw+CY+Vo
	1iPA5ysoLDo5ZKdg==
X-Received: by 2002:a05:6214:b6b:b0:8f3:e97:59b8 with SMTP id 6a1803df08f44-90778387d8bmr228607946d6.29.1784701305391;
        Tue, 21 Jul 2026 23:21:45 -0700 (PDT)
X-Received: by 2002:a05:6214:b6b:b0:8f3:e97:59b8 with SMTP id 6a1803df08f44-90778387d8bmr228607816d6.29.1784701304957;
        Tue, 21 Jul 2026 23:21:44 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39ef6888591sm2595881fa.5.2026.07.21.23.21.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 23:21:43 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:21:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Esteban Urrutia <esteuwu@proton.me>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org
Subject: Re: [PATCH v2 2/3] phy: qcom: qmp-combo: Specify PLL version in
 qmp_v6_dp_serdes_tbl structs
Message-ID: <sjvy2u27dxljx46iu5pqvtze6snrqnljmcs3c45gt4ckeuhwub@34mbkowlmapv>
References: <20260715-sm8475-bup-usbss-v2-0-2d8def39b190@proton.me>
 <20260715-sm8475-bup-usbss-v2-2-2d8def39b190@proton.me>
 <wg6lgpaexz4ktjlfzqpsidj56wr3hjax2ktn75kqsoaubtdxre@xh3yn3xpr4af>
 <b77dc15d-f9ad-4c06-9e24-8f73421e2130@proton.me>
 <dph6cacosw3jzksqxp7fgofdueukrq6a3c5xys4jfrkqjuigvx@sroivvrxiwxk>
 <47b1db2c-6314-49ce-a7b9-f68eeb022295@proton.me>
 <zd5wulhfcw7vzbwaz4akhetbqqub7ygsmexuswkdvzxcfmqvqa@hom4ax54efft>
 <8066103b-e1de-4b20-b21e-533a6cbc2bba@proton.me>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8066103b-e1de-4b20-b21e-533a6cbc2bba@proton.me>
X-Proofpoint-GUID: 8VpJrg12LMOLbSH2-K4j2tm8mvnNG_b8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDA1NyBTYWx0ZWRfXxkvkGLJE97Fk
 Fp8Do1ibHnXstAHzDnDjLot+YpKtYvgfdb2z/Wy6Ce4jqnzPmrLFMgNqympZ2yUM+AQ/PnHcEBc
 sgpHESFzi3m+9VEmggnfF1jTRdc00vracYh97qqCkK1Pfc81WFsveM8nixYPA0X+QrZWMasGB1Z
 6iNx6hZXhFwqQ2kRfDr3kCzu0GCOhgyKi3aCTO33haRlIMFfJmnSgxIzkV4DKEEZFakTPhHFtt/
 tUgxRpQcrLKPlWOWmICOXt0QLPgAYZiBz+/KQgor1QgxBJrjMM1BcFVTlN002uG+7wBSj44pnI4
 yqwZv6zc1gAyq/GXCTllWioo3s8ySbQ38+bV9zsJTDu3Q/PU/Zz9aZxf1LP5sGmNCtSs7s+3wbY
 JuGAvL6OLBEMu5Y9SSbo5N5ytzNfVZnqvaCrqN5J9mf1iaaLyaTw7hZBeoPkU2Iwj7pjoRJnyeC
 sGOOU+WMxxbDNNisYrw==
X-Authority-Analysis: v=2.4 cv=e/o2j6p/ c=1 sm=1 tr=0 ts=6a60617a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=ws2oWbXhS7LMuVARQf8A:9
 a=CjuIK1q_8ugA:10 a=zZCYzV9kfG8A:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 8VpJrg12LMOLbSH2-K4j2tm8mvnNG_b8
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDA1NyBTYWx0ZWRfX6LKXmdfdWMur
 fY7i0xYlWnUIQcUpEv9h5ef1AjniZm/ybtf/jpWWxe7gUMtELBGvE71tqnPrEK13zvpG8WvxNkt
 iRnsIJMbvzzbyKpskM7Hf+NuaPvHWPQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_02,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 phishscore=0 clxscore=1015 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220057

On Wed, Jul 22, 2026 at 05:51:39AM +0000, Esteban Urrutia wrote:
> On 7/22/26 1:34 AM, Dmitry Baryshkov wrote:
> > Yes, because the platform has different refclock. 
> Sorry. I think I've lost the thread on this one. From what I've
> understood:
> - For this commit, v1.1 tables should be left as is without renaming
> them.

Yes, you can add a comment that downstream uses "4nm-v1.1" PLL type at
the table or at the PHY definition, if you that it helps in future.

> - For the third commit, v1 tables (DP serdes, RBR, HBR, HBR2 and HBR3)
> should be added along with a comment in the driver explaining the
> reason.

A reason should be explained in the commit message. If you think that it
helps, add a comment about 4nm-v1.

>  
> Please confirm if my conclusions are correct or if additional changes
> will have to be made.
>  
> Regards,
> Esteban
> 

-- 
With best wishes
Dmitry
