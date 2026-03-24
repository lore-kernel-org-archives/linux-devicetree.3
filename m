Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A687935A93C
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 23:13:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774394016; cv=none; b=COzBfnkibQ1eaTacdl4SpqQbo8vIhIEHHY0yhflP3X/dTxJ7GKx3iy9V25sNJn2zw5DvCnyG9ZiFsuPIhKDPBOt55Ti3+H65G00aR1sg1Fz8FZPN0svH5NK6ZMq/gILDSvbCv+ZyyQWUgzKQbkHygvEzH00P6DMvY3QGaEi3pWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774394016; c=relaxed/simple;
	bh=VnJEUpt8Pn7TMxFiZmKTIjn63h23uf996H0jDMY17m0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FegePoPjzr9auUGIOm3Bqwpg0M8pt5DKHryD2VGcchFGqPN+VscjSly131xSUuraBbS+jxNoJ0vGFbiM666Z65FiB/4bGKYVIlzhGq0/LItMAZogeGboTV9iAc1ADw65FstjJNk+JgujveFFff+5IbPRD4MSzhQSZ4OHp2xJYAA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=A/XlBMu3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DW+43oaU; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="A/XlBMu3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DW+43oaU"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62OMg7CA2787794
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 23:13:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Ub388pzW/wDo7n70J6wJkQwd
	yj2opG87yqZpV9tyaSU=; b=A/XlBMu3lQ61fKzjZB5JV81gDFvTy7BDXCA9vgLF
	DiXRC81pwqkTbL6bHmGmgDLQaPY3KaX4DQ+FlpvST8F2hqjjQtJAgnXnZ5k1MsAA
	4/W7BALdv4+CI+TWdI9swO2JAgn2J5dx/VE7Lw7M8vC+Rx7rnagu/D+6RYbghWbB
	5BiBZJRFsfsxvXH1nrQRYQnwYhw4FHcxKi5GNPjDIT7nJtyYMkYtV/hecqUjjSbn
	fzSqS6m6yDVo5xK4s0wKYlo0TJFTTsTAv5pTm1qifH79JKmZGGPhqLJnctrZG5W3
	VWACeAjD3Htyw3BxGFg19pPA9Lz/aeFMfL/E6pf0QGrcJA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d3sw42j2d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 23:13:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-50b274f94f8so13743531cf.1
        for <devicetree@vger.kernel.org>; Tue, 24 Mar 2026 16:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774394014; x=1774998814; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ub388pzW/wDo7n70J6wJkQwdyj2opG87yqZpV9tyaSU=;
        b=DW+43oaUrPT3pt3nZRbaKiM5IG38sFZARrFm+LILhtRBDiMYzD4cYdJMbqhRKNl0pH
         IHv0rqZXXlMduIXPE7GcwDPOFN1q4nMvsPNZEh6NELfWRbr9PnRpGd+sDBuaf/99pERU
         RqyNf0n1RX6VQbwSQr9yvALQWLJmMMnhLsPH1O9Tw8NIYdhY+pdVW2IGzstxKMJrDpj+
         y8bmL239vni/xZ6r2BOs9XVzRbTlMJkU+AssuNanPzFo9/9SgndiM7XZUKpAo1CqPq5q
         KZGSzSpmNmsX+tWeK33Txi/TStssdzIVwx+pzV4cRIxhoZTLRklQvbSbqGXFEoAgzsO/
         cF+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774394014; x=1774998814;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ub388pzW/wDo7n70J6wJkQwdyj2opG87yqZpV9tyaSU=;
        b=SbUwNSG1rVhouvqrWKopqMLiYttBvqEL576d6cLitq+EWlypLMMhx/bcBmppN8XaZp
         V5rLCECEBw3Jg3/TEKacFDnrWoqhIRCY3Do72lLjFfoF5dtGQz1NXFrrWwwP4I1Nj1sD
         D5aMgMooDRmH8XMIAdp9lGEydNMKzgL3Q20tmk2U1fdBRxdzDWHazTB8LxkOl10Ctl4U
         rgp3AWVIrDOe2mWJJFvwencLqDZrhhOOvlrOn2fa2orOSdx5Ggq7adopCEwV7roABto1
         HhFIKRzexCnLh+u0q607apJe8fC5EPTrqQ3f34ysJqfpw+BDlxnHpdzL1CiWV+SlGq4I
         OSaQ==
X-Forwarded-Encrypted: i=1; AJvYcCXEmbh0R7TKq6/hXDmvvkEoqVV+FfITmRHekKwx1daFyif3MJPh2JEzJ4JvCYn8kUW0DML4DMftzkpf@vger.kernel.org
X-Gm-Message-State: AOJu0YxWcHq0GXsw9bHgyWPWheZhn9bTFB9F6x02f9XSM2xu4xTApKgF
	lgqMIVlB++1Ta99e85IUJWOvoBiYxhTgj8gKgT/6wuVbzJHtdt+vbN0p6n6zMWVZnvRNmsZZI3W
	qcPWU7MNXk7soW7PfJhr7d007Uwp3RhTmcE38p11O3wI0DMRGsBJ1hlDptAz1JfEt3X46wfrc
X-Gm-Gg: ATEYQzzreCFonz10EPuGtJ1nXZm8WfkLve2anYEfg2WJCYEi9KCzTiN57+FMjvDyp1p
	KH9Dwxtxpannx8+clgMO4WvF9VwSQnujisW4LNETDQXAvCxNgdzv8UDZxf+x+RffwQzInyNLNE9
	e3EjWGaB0M6ITrMBEMZzvFqGD+6yYvVu4s1mhhzSGX/fZk28mp9bxAhv3iNGJVGXDfYFni8P5mx
	Fd8ktQi69/8G07IoK7POUXq2LzxkI58Gp5bVxJ8rnAbG/T3Zazdzbe6UwRzqxD1wkkSDb1KueS3
	yknvai5ERwIDFda4nqT40Oi/v84JpB/zQ2OTLTLP4JioxoFYixxEuQAefIiaY3HTlu/ltm+Nnue
	j+xHKfqOH5tb1jpvfTAO50vkSYsiZTddmo2pIl1igYjfPQ7djrdQ44lN4zziYyMZYRb5kbB4qtl
	vbtHp5i3c8Pp2uk3j+RCOfUfPUoNJ/Nptybr8=
X-Received: by 2002:ac8:7d90:0:b0:50b:47d4:a055 with SMTP id d75a77b69052e-50b6ee6aaebmr74622541cf.27.1774394013810;
        Tue, 24 Mar 2026 16:13:33 -0700 (PDT)
X-Received: by 2002:ac8:7d90:0:b0:50b:47d4:a055 with SMTP id d75a77b69052e-50b6ee6aaebmr74622131cf.27.1774394013368;
        Tue, 24 Mar 2026 16:13:33 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a285192e93sm3462838e87.13.2026.03.24.16.13.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 16:13:30 -0700 (PDT)
Date: Wed, 25 Mar 2026 01:13:28 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: purwa: deduplicate thermal sensors
 with Hamoa
Message-ID: <ftdzj5zcxs44zm3yyhv6hfwejkmxyfqb3w3snfeey2epmfuafz@qjl6ooz2gyzc>
References: <20260320-purwa-drop-thermals-v1-1-2c9fe046cd02@oss.qualcomm.com>
 <f25eb68c-3877-4ce7-b3cd-0910a00be30a@oss.qualcomm.com>
 <xy2jzlamtkpqfpcpegoysyh6u2cnfubkz5233yvuuzfutzpxkf@w3inytibm3sq>
 <7d13d449-17e5-4838-b4bf-f9ce14e1142e@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7d13d449-17e5-4838-b4bf-f9ce14e1142e@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzI0MDE3OSBTYWx0ZWRfX+ooHS2AsylPd
 1qAUNVuE45u2cCWHfg2SYvcFpzl1kHtGp2lAqXTdNHcaexq3msqNB8ar8g7u09IKPnC0vIaRC3T
 1AySM/aUMbZ7qjtlVaSZpxDTC5l+X3rJqBTl2wmzZFmcPuZ8o9rLYbDLwqlBa77CLCqcM+nVF86
 EG+V0FIc/+p6PtFqRq4bDS62q7r7PfQIjIVPW8RQBK77Fbri6S/x6azEXZu5mvQwOqLT/KasCxH
 3pUlp3RhV/5llE5y+ck9Zg8MTsVaV7uA4pIMFHdVTEUcRLzTYTMRlum4fpSG6uDEZSuhlfCcbIO
 Mrj213FycV9jsNd4DDUbhxud2pM/CVxpynuTDpFEZ+IjzlWjvDKN+csJBAnSLLRorSCyOMy2tP2
 jNhBY1A8b32f+JDvor7UfnhnhP00+YP1X4dWvJ2qjnuVw6qwRhn4GnpMuHXZ5lU5VU5o7JkOdPn
 ZVPW5KX8NpeWlLCo9CA==
X-Proofpoint-GUID: ca8GrA-049LMr7il5ZY5FLCnv2r-kmk8
X-Authority-Analysis: v=2.4 cv=bpVBxUai c=1 sm=1 tr=0 ts=69c31a9e cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=tETO4GxROsegJAF-TI0A:9 a=CjuIK1q_8ugA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: ca8GrA-049LMr7il5ZY5FLCnv2r-kmk8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-24_04,2026-03-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 priorityscore=1501 malwarescore=0 adultscore=0
 bulkscore=0 spamscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603240179

On Tue, Mar 24, 2026 at 10:25:30AM +0100, Konrad Dybcio wrote:
> On 3/23/26 5:49 PM, Dmitry Baryshkov wrote:
> > On Mon, Mar 23, 2026 at 04:21:00PM +0100, Konrad Dybcio wrote:
> >> On 3/20/26 3:33 AM, Dmitry Baryshkov wrote:
> >>> Hamoa and Purwa have pretty close thermal zones definitions. The major
> >>> difference is that several zones are absent (because of the lack of the
> >>> CPU cluster) and several zones use tsens2 instead of tsens3.
> >>>
> >>> Instead of completely duplicating thermal zones for Purwa, reuse themal
> >>> zones from Hamoa, patching them where required.
> >>>
> >>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> >>> ---
> >>
> >> Slightly reluctantly:
> > 
> > Why? I'd really interested here.
> 
> I suppose my reluctance comes from the decreased readability, but then
> I suppose the silicon is not going to change if we get it right once, so
> it's not a real concern..

I see. My usual concern is opposite: to make sure that we don't need to
fix another DT if we fix something.

-- 
With best wishes
Dmitry
