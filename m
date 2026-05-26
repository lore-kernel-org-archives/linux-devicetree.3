Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0BD13FA5C2
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 13:43:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779803027; cv=none; b=YMwfrswIYCfQXHFO0nClriBGJ/YO1Cm0RkvTqpymlEyBbzn/JSAyqeo63ODfXKCeQZM7jAD4/c7cCJHpjhwgXVN00A3FURX59gNA8ertW2L51AjReh08kyomTN2LD0QrUsz2tv7tzbxuO/bU09rSoXPcwa+8I2Tho6OdrNhi0MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779803027; c=relaxed/simple;
	bh=2x+GvNK+8LsAyeENUcpy6NQiC7D+AMmUeAQf6e9WMOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CJJu695/iLhEuP99gmi2ndr+epEut/XlvRuiQMNQ3TEMGECv+uBol0g/X84C6p12heX2+tpBXqhFWsE4rg5RAyj2tLs1wQyFlAM98UO43uKNKRd04P5UqKQoLsclszOmQTBmhEBu0EMzDwAeak32yopKgX26evrghYdXjIau2SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SK9ncPOu; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=C9DpACHr; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SK9ncPOu";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="C9DpACHr"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64QCsCsQ2554544
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 13:43:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=sSnJHbNRLCRzAj/uxtSz2ph+
	Cjf0LPA0vDHzMyAXWg4=; b=SK9ncPOubFILx13HC3G0erUqgLSsIOOXtK4ocNqc
	qrCWASWwYyroOH8PSf3EgvEMU0yHcgL6u3kZWgaOs6DF0xkM9XiyhXbqPCrefmz6
	EEZ19cHiEs6nXOFC4CtgMhQAEiNe04cwIc8VuuJEGaiNpQXpXTLVfmI3tI+XbXQQ
	t7kVjkF5bZx2jDygD4a7PD9x2Qp4kg9FuPa712FySxOmxwOGO4IMIj75mD+rOgXl
	mVMJufypweLjtvZi6rEOD+ghIoqfTfdGcyCEK5eoU6SCn4Kaf4ktvsaOIC/JKfgt
	y1fuhLFAwUj/LFBu4GRf1RXgfmpQ+DO0q8cxy93qCRdr8Q==
Received: from mail-ua1-f70.google.com (mail-ua1-f70.google.com [209.85.222.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ed5v3t3g3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 26 May 2026 13:43:44 +0000 (GMT)
Received: by mail-ua1-f70.google.com with SMTP id a1e0cc1a2514c-960476ee6f5so3668305241.2
        for <devicetree@vger.kernel.org>; Tue, 26 May 2026 06:43:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779803024; x=1780407824; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=sSnJHbNRLCRzAj/uxtSz2ph+Cjf0LPA0vDHzMyAXWg4=;
        b=C9DpACHrV7MayhcKk1Vo7RgWljsUOpWDi4Hsq6blxVCj8le1r6GOM714dIKd1GYzlg
         05Gcaxor33ALc1KKqXgy6HF6JSbEnnztNsgMcFlhBut9TEd+EuYeqj3dBZQ6Ur+dU3tO
         XAw7H3Ak0k4sHjipEWGoYlMQuyxzhiC27NOpJHaEkblvW9U5gYF2ajXx4TX2guTR+zuT
         buFbEMJfXeI6lUJ7Ol9DBmbjxRD3TIVY4xpSsnkVUyc2muUWQfehxo04gMiDJXQgdfQS
         5RZqlA0IhW5YGQ1qp7QgqvmZA3RGY3wAGfhjLNtFYDZKhImQJzqTHIy83luEBn51ZmWs
         dbZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779803024; x=1780407824;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sSnJHbNRLCRzAj/uxtSz2ph+Cjf0LPA0vDHzMyAXWg4=;
        b=pf/YoywPhqW7sclwtYuMZXqMoo2oWUPL7L2lR9A4UlaMwP8l0TSxmVr4nu3z5WpN8Y
         WVzhDHwCxgh9XOArnbsNyaQMToVQpiwd0e6LQq+CiHTeqDptXVVyM0Ve94s1VxY8vTm2
         FetVUw5nTXviBiOlV78gOuP+sM5+mPriCdxT5zGdp6frn8CslztZefN6VET5kcbWqF6r
         DiTGXyrTyGqm4r1FgpLiwW+WBbenBUto4hSCmdZgpkp+jFX7YnheLViKp3qA+Xthh7lm
         oWSsUu+nw60g+lWzMVAaJVzeNilxdRA7Gvb4mKXRCgpIT8FOQticzIgrzwBk2Urxf4DP
         cj8A==
X-Forwarded-Encrypted: i=1; AFNElJ/dgVprtQjc0Els4Lv0xttxV6BBZvE2r+z96cufZMxd/MRN1T1Sqz7HWc2ZCBZ0Qn3eXvwMFvXAGOZO@vger.kernel.org
X-Gm-Message-State: AOJu0YzmHN3+7MIDtuWrnPqJXZzSCyYGJ8AeCYqsye+YE5+8TdcKpsz6
	Ehd0ZVbI3VFChgfACNHi1EolLArrFPwEnk6f40EltwRZRYkJxhA4ikag63/GxluvGcHWHi4WmDN
	UKb57Kklg2P/txh/Tm+TRx05clKOoYpssmRQW9MTUfqdmtgQ0fUuYBhT1YtJNhRjG
X-Gm-Gg: Acq92OGnYrCnrIIWvLsWHcCdzarWBh3vBiUxyE6AEczxRdFZaY8m2W3NLpVBeVjdQU3
	4lKTcT4gUlEh3U5Beevc46oSe8Z9MTJnXxVWGZm8t1i/5zuCH30fa3BK5UyxDZvQ7yRCdxWstdK
	flkNr8hdS+qKmB/NJEl61mJnZjowxtuvg7Oc29r5DXInDaRuDg8KUHJ+LrHfEVrx5Y7Wff53AC1
	CuEEnge82biljReT+2/J9lxYNsUm8M0O3wvhQGjsdS4f+nvUxEkazFbLwp+Q+ijHjzR6GAAOmoT
	5OwD/qzS2KEn7bqD3NHdg4fj+4gjG4pymZrUSs788IbCW6d3o4mIWng/vQT0F65jqvsMkL0QMpq
	p0W5Qf3djHibZ5p2QxkasNptenuPcxzjZxvFn2N8LWUmgwfoTmjvWX9DJQNmBfMaTLOSc7/WCPL
	cH+hZwr3epigtWqxVqu00yQBVJyKpAcnyu9fA=
X-Received: by 2002:a05:6102:2c8b:b0:607:5cd7:d7c0 with SMTP id ada2fe7eead31-67c8a075bd8mr7549699137.19.1779803023875;
        Tue, 26 May 2026 06:43:43 -0700 (PDT)
X-Received: by 2002:a05:6102:2c8b:b0:607:5cd7:d7c0 with SMTP id ada2fe7eead31-67c8a075bd8mr7549678137.19.1779803023409;
        Tue, 26 May 2026 06:43:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aa4634d4d5sm444972e87.80.2026.05.26.06.43.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 06:43:42 -0700 (PDT)
Date: Tue, 26 May 2026 16:43:40 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH v5 0/4] media: qcom: flip the switch between Venus and
 Iris drivers
Message-ID: <vrbly7s7cguxdubha4mxj5hszicp5dqkdmfagqdxruadkdddqw@qps7wgp2etqq>
References: <sYZHD3u8jIct2FxvEcwr_2zJAwlRZlgApp_nZRHcBHzhnTYkersBivmgF9agXwr_MAMQq9aXHnEfhYlOs_B6qw==@protonmail.internalid>
 <20260327-venus-iris-flip-switch-v5-0-2f4b6c636927@oss.qualcomm.com>
 <ad61077f-4e7b-4088-834d-0fd7d3567a47@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ad61077f-4e7b-4088-834d-0fd7d3567a47@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTI2MDExOCBTYWx0ZWRfX2FDQZrtOIrEE
 vBmyQvUhCzKSbXXT9l7tqH5LkJ1R2kxElIhhCnTTI1x6qni4ucdhftLj0AYfy27kMZ2zGb3IrNd
 7bhNQ3GCB0AmF+KSuy87xTwvDQIWvz7mDTIYjk2Rg5t6jYPyjPSx7/ZMLpiefVRBh15WVjBa075
 tpeWN5CDAVQxMDYYYv8xisRZYlDVhwSjkE2fRyY3l7nwoyW8GvdeUsKECiHx28Ds59BQ2OMkz3e
 ME4UMZTUVlQEtWiNeQqkpGfGB76akUmCnvNvgc1uIgf2bwexGUyNUc8dRDVElAIS/eTqaNHVdwR
 DHe3328mkDI/5V0jogCXKKP3RGquBZpme+hfc/vh4Dkbs1dTy+gv6bWStvh6zhqffEvTziVPail
 evhXdi70LNSHA16MUjgOZE/aCoOppuBJi1iwqqjWNZzwJ2PVKDI+MYkPZeRhL5wgTPvYbESk63l
 xHT1vurLkWVKuKAsBOQ==
X-Authority-Analysis: v=2.4 cv=Zc4t8MVA c=1 sm=1 tr=0 ts=6a15a390 cx=c_pps
 a=R6oCqFB+Yf/t2GF8e0/dFg==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=VwQbUJbxAAAA:8
 a=tuamT_7bMBkhMHfOO0IA:9 a=CjuIK1q_8ugA:10 a=TD8TdBvy0hsOASGTdmB-:22
X-Proofpoint-ORIG-GUID: 9LXepAQQ3mwejujhOD6LYmDaR9u0Gyn8
X-Proofpoint-GUID: 9LXepAQQ3mwejujhOD6LYmDaR9u0Gyn8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-05-26_03,2026-05-26_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 lowpriorityscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2605130000
 definitions=main-2605260118

On Tue, May 26, 2026 at 01:49:15PM +0100, Bryan O'Donoghue wrote:
> On 27/03/2026 20:19, Dmitry Baryshkov wrote:
> > As the Venus and Iris drivers are close to the "feature parity" for the
> > common platforms (SC7280, SM8250), in order to get more attention to
> > squashing bugs from the Iris driver, flip the switch and default to the
> > Iris driver if both are enabled. The Iris driver has several
> > regressions, but hopefully they can be fixed through the development
> > cycle by the respective team. Also it is better to fail the test than
> > crash the device (which Venus driver does a lot).
> > 
> > Note: then intention is to land this in 6.21, which might let us to
> > drop those platforms from the Venus driver in 6.22+.
> > 
> 
> Not applicable against -next with enough of a splat I'll ask you to
> rebase/reset this yourself.

But you have applied it already:

https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?h=next-20260525&id=8f100f5896e1ccec3802dafd0f719627733c8183

-- 
With best wishes
Dmitry
