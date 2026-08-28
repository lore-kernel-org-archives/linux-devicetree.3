Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52D17410D3D
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787921846; cv=none; b=AWqwGyylnKU/ixE3nPE+c5myh/s56ycmdCpo1cavcrTYMntLHgseSp56PvfnZvR7kje3IJRXtBeoE3mwLfbuDpPkmigSMkeOaaourvcBqDAO/ovAY/rzDIf2uTPSD5m886gm33ZkCrbOeYE1NqJti85gXEbAaY0TTV7g33qsves=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787921846; c=relaxed/simple;
	bh=ru+yAHr3urcJ5M8KBNo1D5Vm86Tk1kQzSSNlmFlhCdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D8ktszw+X2fK0Z9poubFbc8xAZEmRO7s6OmernhM6wVhk0R7W57c6Desq0soT06KaphqQz/IdsBvj2jvtXKuRernUwCbcWUDdMf5sig/0YwvT7sMaATMR9K01SBu2yj9NPbw6hgShqL6MqNQjE+8QExuPn2RMaWpf0iS+RGrndM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=dCvK7way; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g8Dt6lRR; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="dCvK7way";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g8Dt6lRR"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67SA811S3750817
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=6mztBACuCG3RrcAN2JymhhQd
	msNbc5JG/TyNTdYCnpg=; b=dCvK7wayBREnZu+c26O85FnFRAduOdGhC+fgLPGr
	qWF2BCp8eMYP4UEvj7wyOZf4PxYQYOq7mWqUFnYlCRKTgj+2iSRkPrUZKszZCVVi
	2P5LtdddbCogNWmVLUh5zJMGkgdysU23qY8ti5Mv+y6qhkVlmvOlJQHfob/AD7R5
	v76WDqzPFinCPkfUU0wRaKWuKDYvXlpjRZo2Gkrnw08xKVU60zfJHBMcCFsBQ/qf
	PKKuH0413SrI2k0ft4h7FJ1MkzJcgSWIZsoow1ZKM3iBhNpIts3cOPr7odQK6lad
	uuoMjtooxruBBe+y19UPcjVUHxlchXunpF46x0F1iyJhSw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gb8afgjrk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 12:57:24 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52faa0dd18bso23202851cf.0
        for <devicetree@vger.kernel.org>; Fri, 28 Aug 2026 05:57:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787921843; x=1788526643; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=6mztBACuCG3RrcAN2JymhhQdmsNbc5JG/TyNTdYCnpg=;
        b=g8Dt6lRRdus4yPr2fMoA42Ji5eoPN+6EjUWjk5YjUatpEMuXubrs31D53wXPUFrcAH
         xfJVRDrEr9jH+2zpKULAQRo4nnBNjP+s7VJuuMEomPxMahfUcXu2KcXMaq+Sszz0P+OB
         pqnP7+IK90CMmDBvQ5Wz4Uw3jCsr/7kX2+zaoWlqaDkXRzmJwTqPCYrFEssNMhZ/o/sX
         kS55eMB6C46Y9zp7jlHnUKorQo+E/MH0/ST6x5mefZb+gArM1q5sVhDKa2Gy2Bt0K+04
         9EHDWKs9/bFLjRGujHZqe3CdBUOnZun2MH94/l+21fe8sVMTpzeY80w/+ER6guhrvpGm
         p30A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787921843; x=1788526643;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6mztBACuCG3RrcAN2JymhhQdmsNbc5JG/TyNTdYCnpg=;
        b=HZ/HxoofMs7fOL7/qdxYLMWqGSq1BPvLwAhvNgAyaYWZGPSZx5fGqKkJq5VVyb8AWa
         PeXHPA+0+56pj+qcw+CGqhbxFZXUzgDZ9s+Gx1JOKVtZzqS76BYDkoATKmUWLmT9gcrI
         4dZ5QL+mVd4PVxYPgXdXbSYVmTtHrX8mnogHkGGGLEq3nwMXXvj9mtt+DBTbObNsB2BG
         dd4LvrJj9y+gQu/lARTV/yQlS12kNDSDmpTgPqv8dC8Ecfqk1TcSxvQqE81z0g8cG28s
         lL2oYa3RxoqgLzmERAGjEjsC7RGNM7lB7cAdqcWEgDq79yemzxrXb79aqTm92s4+zXYf
         0IgA==
X-Forwarded-Encrypted: i=1; AHgh+RqL8WhL6ABcN5SXdlv0QeUhPnJI1EejvDoGhxnhGrQ84Bzjgy+Vs2WIlAgMRYNDiIKL8cobZNHgLq5r@vger.kernel.org
X-Gm-Message-State: AFuF++k5rTFB+DRjXgc023dhqeXXyRPfAlvgCe/1o011mKO8KAbgDczG
	Tqej/CIFhw/m1hIqhLbKsH/4bFg5mt+aY3gSY1UtrCNFkNyE8fHpxhmuBcWkNrvIKnQ1H42YQ3F
	BIjIPlnSlBVmC/S9zRSGYYwHXLniBq9kFNqs2EgauojabqPIuMWY8ZzbWnMrA4lHQ
X-Gm-Gg: AR+sD119pQMtHHGylwPrpGcRUD0yE974EvjP5ukgxhgYKZu+SSVRVFqYXptJs7gEYg1
	tIwHLHDJ+BR91c7M2acx5U9UU13dg8leZx8BG2izohIzc82d5Q/m/Z6Ky7FOgnyp1rrrKfXQ00y
	tkTIIM8gzxhRDCWWtVHLjS1YIeLyCv6ReaxnVnvHKxmMPU3CereBCI+9drjyWF9sgJU5RHZ8QDt
	FQu5BhxOjwmrJPunJ11+EaOpeHRGbZoS9xt1Y4LtR6jMsRNwpsmc7S4vgJ1nOLh9YsfvAs5jmGl
	EpVcGUnj8ahxO8j1xX8VT2vnGWEhnSjwIuFjNpscUVtDaP8uErFjFKhmtzw6x0zniUbEaiRByzB
	SpxmnsEknlixS
X-Received: by 2002:a05:622a:e490:20b0:52f:bdbf:4086 with SMTP id d75a77b69052e-52fbdbf4745mr34332561cf.23.1787921840516;
        Fri, 28 Aug 2026 05:57:20 -0700 (PDT)
X-Received: by 2002:a05:622a:e490:20b0:52f:bdbf:4086 with SMTP id d75a77b69052e-52fbdbf4745mr34332171cf.23.1787921840006;
        Fri, 28 Aug 2026 05:57:20 -0700 (PDT)
Received: from oss.qualcomm.com ([86.121.170.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbac8e61sm3986925f8f.13.2026.08.28.05.57.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Aug 2026 05:57:18 -0700 (PDT)
Date: Fri, 28 Aug 2026 15:57:17 +0300
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Kuldeep Singh <kuldeep.singh@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neeraj Soni <neeraj.soni@oss.qualcomm.com>
Subject: Re: [PATCH v8 2/3] arm64: dts: qcom: kodiak: enable inline crypto
 engine for SDHC
Message-ID: <mwf5hq3gnkesmccede2sa5ni5lyxg3zfnxvwchts2nxh25zndw@uyn4dqehfdpv>
References: <20260629-ice_emmc_support-v8-0-1a26e1717b85@oss.qualcomm.com>
 <20260629-ice_emmc_support-v8-2-1a26e1717b85@oss.qualcomm.com>
 <ba96f5e3-6b6e-40b6-b6c1-300e862e8ee4@oss.qualcomm.com>
 <d3be45ab-0390-4d0e-8d5b-330a48c529a1@oss.qualcomm.com>
 <1a0b91c6-5e17-4330-a8ab-ac14d3339024@oss.qualcomm.com>
 <ffca92db-a3ac-4345-8477-1f53ec61ef16@oss.qualcomm.com>
 <56ab63c3-4288-45f7-bfea-d40046437a9f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <56ab63c3-4288-45f7-bfea-d40046437a9f@oss.qualcomm.com>
X-Proofpoint-GUID: PEZuwBatS6arhc7NdLtW_LRND5Q643aK
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI4MDExMiBTYWx0ZWRfX8A9gMNkrau5/
 vMvH8hvtAtk70nGP92CJgUr3oIrt894/miaXc3akNaxQx3tLJhVI49gS/yOqcF4MZEC82temXzd
 Q4ZzIutfNq/osHj5knR/y4h/GQFZG/4=
X-Authority-Analysis: v=2.4 cv=IPoyzAvG c=1 sm=1 tr=0 ts=6a9185b4 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=clBUptZa5v5FR042Ey+sjA==:17
 a=kj9zAlcOel0A:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OvFCWnAnuTFQFf3-HNEA:9 a=CjuIK1q_8ugA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI4MDExMiBTYWx0ZWRfXwQxO5p/t+gbs
 5gB1gcv5GSzf+92VQdW3OBoTVg+h54Mx55Nx//OhHWRrPL79f2epVgEcT+XSwxPEvcQk0imKA+j
 A3ihOOI1juikfycL1mY3aXzILzWw/U3fLqpObGH2iYdHln8fc5/EG9+Nzy4kJqSGnzLBkopEwLn
 PKDX8IyIKv2dOTmr09q3lhAFBGeYuW6JhZ46LreS4FXpcGhMj6wxssBrOXwOKtmctHOkQmQiBFl
 MbC+GvlxVeXvaVaD7OKvIVBNs3PcsDHuetmGyouVP72YmClNPfAzNvL7xkHBfUBp/5C2Go1uSLy
 J2IO3fxfIKtEX/LliPuurGo7NlR1fO41q2p6vGxOpNFX/nk54Wn2zzmZGwr59y4g18GYW/Us8YW
 kRdCf0CdAjqD4tcYVL+4sE5MTcTBKPQd6oLXmAfQX2un2n6JjPKBVPlP5J6M9XDYhIrnceljiHo
 /hf1hK/YCqhDuX/HAaw==
X-Proofpoint-ORIG-GUID: PEZuwBatS6arhc7NdLtW_LRND5Q643aK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-28_03,2026-08-27_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608280112

On 26-06-30 13:25:13, Konrad Dybcio wrote:
> On 6/30/26 12:23 PM, Kuldeep Singh wrote:
> >> qcom_ice_probe()
> >>   -> qcom_ice_create()
> >>     -> devm_clk_get_optional_enabled()
> >>
> >> If we remove the _enabled suffix and put a ice_resume() in ice_get(),
> >> I believe this is no longer an issue
> > 
> > I see your point.
> > devm_clk_get_optional_enabled turns clocks on, whereas using
> > devm_clk_get_optioanl will only get handle but don't enable clock.
> > Please note, clocks are needed at probe to read ice hw version 
> 
> Right, but we don't need them afterwards in the probe function. We
> can simply gate them. There's a parallel effort to enable runtime PM
> in the driver:
> 
> https://lore.kernel.org/linux-arm-msm/20260512033750.3393050-3-linlin.zhang@oss.qualcomm.com/
> 
> and with that all you'd need after getting the clock is a
> pm_runtime_resume_and_get() before the version check, followed by a
> pm_runtime_put() right after it
> 
> 
> > and then
> > later ufs/sdhc fetch ice instance using of_qcom_ice_get() and control
> > suspend/resume path.
> > 
> > But my idea is, if storage itself isn't there(like sdhc on
> > qcs6490-rb3gen2) then why sdhc-ice should even probe and check hardware
> > version? as there's no significance in even probing ice.
> 
> On the developer/customer experience side, would you expect having to
> manually enable what's essentially a sub-feature of the storage media
> on every single board?

Wait, don't we do that for display nodes anyway ?

Also there might be a case where you just don't want the ICE enabled.

So I suggest we disable the ICE by default and enable it only on boards
where there is a consumer.

We don't normally leave stuff enabled just because runtime PM will
disabled it for us.
