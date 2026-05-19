Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D8632882CD
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:46:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779180403; cv=none; b=pVXZYjeDQyFPkifQgKK6Dana2kcTM+yjYoTYXoqWkfUqwaCYClzIaLWLtJ+FR2zWlkdGG8X6YY64DBi//gAUQ4/647p3WMUH2i6csiG6U4NlRmB2QAJNrSWojhUOAa0gPBftu+uVpCZMXbO+mNJTtBN4+OtF4YG7NzWoOLVYwU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779180403; c=relaxed/simple;
	bh=EBaHQIAJuVILdNhAzgVxlkgAGQP5kOdYvt6/uiqvLL0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PpuTvkCx7X3wVSscEeIvtKaxWXkLu4vOyZE4LvLVd9yYIfN7kqrhRv7M2YoOzOUc+D2Tw1gM9K1+Ka7ChYqN2tSb7QC/ye38LE0NN0D1wTqeXb+fxuYZM3evmhDXsMh+UbhvUOzcAJdI6MxrVmvdVSoyqqEBgvgUXak3inlQZXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m1P5fMIo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=krk96jBT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m1P5fMIo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="krk96jBT"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J5KxdT1252691
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:46:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=hCZMgq9t5NqGZfPM726jbwBP
	EARH5j7MI2OBBqd1/24=; b=m1P5fMIoYh7zCojQhIOESBWr0Put76/oSIUn3gss
	PAdZlmcKcL/jnCol+PMsZStAjzcBubiVq8kb+pRt0FWhmlMGHuyTZiZwJLq7MP4r
	+NKoxZnRCKBBx2fAEGW0619rY4fr3sf1YG417c2/1BtYyZMoNKCuc/malv5kPiPL
	In2Yjzh3ms1OI0VrWkm8ACc8/mEWR3yUHCI3mMl6Y6aKyJ8+yVKeEKYN52xzdf7v
	ygqZrnRR9X7WP2xpaBJQtU6yQQ2D5pMbtzlvXzZXlC6uDqSdjISQMjlgifYTOwmi
	tLOZxLNnPhEQIZUpN6kUCWuSWsztXrd1bz3CnnfDFcS6lA==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e82c0maeb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 19 May 2026 08:46:41 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-8353fbc7ad5so1772819b3a.3
        for <devicetree@vger.kernel.org>; Tue, 19 May 2026 01:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779180401; x=1779785201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hCZMgq9t5NqGZfPM726jbwBPEARH5j7MI2OBBqd1/24=;
        b=krk96jBT7mzHtAN5vdEJL+Bl/1DZa7C8BuP4q5EYa5AYyxmF3nfcQferSNAnikraeD
         5gbAmrQiIcum2xj7epSkLDXir/kRKwQEUmg231NexsLHobhHtsGeQZ5KBf8W/Z9ul0WX
         LjpZSptT3+MEVWundVCML5D+qutBXvAQqbW2Lre7gGpXtc9fN3C9O+Z7LnwfIWb6BIpe
         OW0mhASK7MIj7Q++ewB3O3GG1RcnIY3nR8H6EsLT1LdJ3mL8rqnuUgNgkJfxYxtNncJ7
         TN3m3kg38fp/Kq1d36FVwV/UjbF9izosdrPGr84jxUXv3f8P9qd3q6PB3PLPU1HN2MIh
         mcDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779180401; x=1779785201;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hCZMgq9t5NqGZfPM726jbwBPEARH5j7MI2OBBqd1/24=;
        b=IjkoXJ0cT1WczfDF8/t/NRhq6+KX64tSGzIappHXVeRsd3AxznZfEojpqWk6rrBvVy
         LIJLaMXjmQMUGFPgJorphobKEbf/O8JXoa/dncl0NZINbf0FeXs1s+xDeg3/p1l3hjXo
         CzyVT/oI3mGU2RkS+pBniVWyBM+M6l8nsd8ziAdNC2o4u0bvGMXPPT/TQEBvp0dTStTj
         oEHHtxh9R+4wd6R7TDK4y7FkLQBisXRprwJ6UfxBPjieoifDHkySQI36CtDGmvOT3l+w
         7lVOVNiOznW0Jqb+GIx1DpF6Ao1Scb803k+Mbs6mVWF3a4VaU9QBZyXe8zi9FIc2b2lc
         kY6w==
X-Forwarded-Encrypted: i=1; AFNElJ9nlmHer3TfrH+xWOKHEnw1hSBuV13NY1jQliStOqbP1zZV5y/qEIs66KT6X99SIfW7UtUyBtGjItgq@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ94mQk6nlgYPaDyv5YEnbNP0YXwm118PGLuuKfUtd01+o2bBG
	KED3v8iHwAwuy30NHZOOq/vftbn9H7PVSTqh4ICZIggWB95+BZmog7tNuY+/O/IbKfDXJwwhBJM
	ugxE93QgCAF1fbA/O2kGr3ohTVEztySmrRHlaiUn9xUEvUqABFH9Frrq+rLKRPtKK
X-Gm-Gg: Acq92OEF+wF6hlu8Jku/deBA0BqLFsuQCuyCvQRsutM9nAWLc6wMJ2XaA72swEBacEi
	RmzI0bfZa0Cw4g8IzkHaCU/zflPCI2MoE8XMy6+xyhP/d9cYno9brz8rElIpn9un4x3EPNTvGyX
	dQ9Aw+isVgvDlCXzPQP+XFuilMY1eox/j4MLRCiiDUJVFnNMGY8+ey2+T7SENs1G9Txz2Tv2CiK
	83TVdT/PT6ndcpbT+i5ULfCI1U4jFntuYvjr9Pq9qc7hy1sxsQYIWSPgFR6LhHUq7Jbh6dIGY1S
	ycgPCmAsSjOELrkpSLz6YSXjOwPmTtVpYrGwGWO6xqLHQRrKRoQdM/6PbTwPvzrKS83e6Afxowj
	auvxMFixg5uctnL5/RTJfXhtp56VTtcu/Y3+Xw/XZamMc0l6q
X-Received: by 2002:a05:6a00:440e:b0:83e:f228:b112 with SMTP id d2e1a72fcca58-83f33d4ed63mr17779614b3a.34.1779180401113;
        Tue, 19 May 2026 01:46:41 -0700 (PDT)
X-Received: by 2002:a05:6a00:440e:b0:83e:f228:b112 with SMTP id d2e1a72fcca58-83f33d4ed63mr17779588b3a.34.1779180400449;
        Tue, 19 May 2026 01:46:40 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19f79b60sm18804905b3a.52.2026.05.19.01.46.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2026 01:46:40 -0700 (PDT)
Date: Tue, 19 May 2026 14:16:33 +0530
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] firmware: qcom: scm: Add minidump SRAM support
Message-ID: <20260519084633.3pkfhw7x6jkxv7pf@hu-mojha-hyd.qualcomm.com>
References: <20260507080727.3227367-1-mukesh.ojha@oss.qualcomm.com>
 <20260507080727.3227367-4-mukesh.ojha@oss.qualcomm.com>
 <3m2bwess4zw3hw2qlkwnmhtclk6ofinxekxfqz5otw65hd6d6q@lfcknrfkacy5>
 <ba499581-9cc3-43ba-8b28-6f984d2493c9@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ba499581-9cc3-43ba-8b28-6f984d2493c9@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDA4NiBTYWx0ZWRfX5k2Ht9QmnWJ6
 ZDCyOsKyRHe10A9ycDz+g44zLL7SW+VrU8/KORAqC17ZIjn68FSdlDgxpY86NZg45ZuZtrIc0wp
 S2tj6P8cABWg1QqbqODZCslEFhAgnGDs4tOcQz8aCOJtW6pJjRYUwSTJPUSlA3BFFWiWuVI5CA5
 X+JeV6RAzAfvjb8FDItLsdKd+VPJfaJFl4Rw1LMkngL6FeaSCEYqHM2UMG5GaSvEUV/QwdQvh5g
 eEI9xtCOE3CMjNg9TyeC7rSclp37R5hotZwPNURE9jaMnPrgOICQakpk3UyftCQ7SAuBXlG3uYu
 FCRrSPR86mJzDNBTrM+AaJ6PCmOvNooh99rNH8nCS9o5ptYzLij2/bLHGjv0obdgKAegDPOecaF
 A/mxlbHCrctlsAcV2wSKAiXjcqbU66GYq4VyXw/UHEHSsCr8qpigD1g0A0U5FuWYlN9Z4vootaX
 odWXVj8GSSWI26tF2yA==
X-Authority-Analysis: v=2.4 cv=A5Jc+aWG c=1 sm=1 tr=0 ts=6a0c2371 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=kj9zAlcOel0A:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=z5fMQXc5Ym5buCV79EcA:9 a=CjuIK1q_8ugA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: nXy0SrYP0NQtKwoUACJP9IiLUYITZi6x
X-Proofpoint-ORIG-GUID: nXy0SrYP0NQtKwoUACJP9IiLUYITZi6x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_02,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190086

On Fri, May 08, 2026 at 12:40:35PM +0200, Konrad Dybcio wrote:
> On 5/7/26 3:50 PM, Dmitry Baryshkov wrote:
> > On Thu, May 07, 2026 at 01:37:19PM +0530, Mukesh Ojha wrote:
> >> On most Qualcomm SoCs where minidump is supported, a word in always-on
> >> SRAM is shared between the kernel and boot firmware. Before DDR is
> >> initialised on the warm reset following a crash, firmware reads this
> >> word to decide if minidump is enabled and collect a minidump and where
> >> to deliver it (USB upload to a host, or save to local storage).
> >>
> >> The SRAM region is described by a 'sram'/'sram-names' phandle pair on
> >> the SCM DT node. If the property is absent the feature is silently
> >> disabled, keeping existing SoCs unaffected.
> >>
> >> Expose a 'minidump_dest' module parameter (default: usb) so the user can
> >> select the destination. Only the string names "usb" or "storage" are
> >> accepted; an invalid value is rejected with -EINVAL. Changing the
> >> destination while minidump mode is already active updates SRAM immediately.
> >>
> >> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> >> ---
> 
> 
> >> +	if (of_property_match_string(np, "sram-names", "minidump") < 0)
> >> +		return 0;
> > 
> > Do you actually need sram-names? Just to verify that it has one string?
> 
> I requested that, because SCM is a very generic node and index-based
> lookups would age like fine milk

I am going to drop this as per Rob's comment. Let me know if you think otherwise.

> 
> Konrad

-- 
-Mukesh Ojha
