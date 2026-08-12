Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D2514334A0
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786538778; cv=none; b=oLXe5+xVMnpomuMyKXzK5z26cHLj55zD2XGYoJ3zGThqRLy663yY3XQyj2vshj5GpDgGWpBRbzewCEHbz1AZRJNKFwNSlKhudKngufqPQEcR7Iz0IY0wCm+FeZK6wFgPpNKmCn2V1zaBuInCmtE6QB+lsYxfxjEjJuaKxKgCXHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786538778; c=relaxed/simple;
	bh=E21HrPIMmupfA9fkmEBQjke1COEABmPd5LbFfsXlw8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RZBcs9jc8cc/uUeTjSsY80YtjWAcqmzqiOIneAGhYlJhUuuTIw0l+P+aZ4K92Xze2g6Weyf7z3YnKoOEudbCfsBF4iBZo/kuyyHt7JVcc0cjCbj8xCn694uJqEF+i2MJ23I7aozapj8+zl7fhC0ZOTXcCs6nVorMvcRAazDtGWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OJS7tbal; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=c7BV5cI+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OJS7tbal";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="c7BV5cI+"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CB48hr569107
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:46:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RsWcoejxXn9pzsu78SYqkef5
	s5cNXJjqJt2DfYmpRMk=; b=OJS7tbalbspCDeHj5pLtNAwqh0q8ytK6Ey+yBVvM
	qHdh68YI0htk4OMnjF9gzoELNLi6xG/mryZLK2tBPEL5cNklKYIcjK5XwL6puWu6
	NDvzilGlIyUgOF0159bjlsVGQ41KqW6a/2M3d5E/yuuxW5bRJpNK40cIf8WcV4m+
	/iFRZ/+otOQY440jVSArLp54RsdzMByUShbE6/IUrG7knCGJ/mDsaVXui7A1Bikn
	z2fvKuD3xLVbzzRA36GHzelOtPuH+SKppCFussVHpsEZtJzzOOnFWHz49k3eEHDq
	7l1/LD3czKQSwFxqcrSJF11+ejT/0Y12Oya2f1FKSbNfGg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0nut8t1n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 12:46:11 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52d28f8737eso17864271cf.2
        for <devicetree@vger.kernel.org>; Wed, 12 Aug 2026 05:46:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786538770; x=1787143570; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RsWcoejxXn9pzsu78SYqkef5s5cNXJjqJt2DfYmpRMk=;
        b=c7BV5cI+fdoBmm8Dj0rGgvNkiUFp77pYst3F7hxdj49V+eNfQ1I+3vmE1fYctVNolT
         y4jom2B7UD80JTtCz0WmqYvfY+fGhHPwFc05vdttzZySOIZhDwrIBY/nAEGvhKxrPclK
         v5kEJ+24kXivw2murp364MbxWkWhUNLnFaRzfvWfTCjyFaBm1BfIRvdrXyLdyAWgm6uQ
         GlcoYELUvxhm+NggRyKuteh2ZEMVAGG03leF22FAOG8iJr7opoObGZLMrEU0kdtmkp7u
         L33EwhjEDzddI/DWLsO9F+mcyNKscRO5iZ1Y+MgehdpqXGGcb94Dz2nWIVBxNaTFx9Sx
         jIsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786538770; x=1787143570;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RsWcoejxXn9pzsu78SYqkef5s5cNXJjqJt2DfYmpRMk=;
        b=UHxCcZVXic0Mh+5Aj291+YmI4u9p9L93zTku+hgdzx7tGR/11y2xDjIRktShk+WnyP
         tFobZIC0PbASA+E0jR/0Wx89dEZYW0Zt0MtmJ5MbEhTAUELHUEVuMNhCiyUxbSqiNPIZ
         pseA/LGj85WcMT1/vkuhXVT5whKTLPRYaeDsi/edPHGmvDNtKetAS2q08raVwqUgSv80
         i/AO+kVTe9eIIyMjzo8QQgd3wDPFda65FasMnDULvKe1PHK73iQaYB+yMr7VE0VEXS1J
         UsYmqIn11ktu5PwYxzxdCeZJITdpJANCFDkwkp8NPpeTH6TKQQQ4UDstueEJHStZUqss
         75pQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSroV4Rtb6c1TI8Q3ueRBrg4camfcgyDqmrE6N3DwsvejfxAWbaotWbqscAfyQIV8Uv9XjPfKDkA5N@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4WvXGDzHKR3Fh8gu5puJNCHjADzdTsy8Fs92mSDx7tSCX+UdV
	qmRorBnOLqyOhzaBimI7JLGSEQkItQUTNxAeMaCSkUNdrm/ErJL5l1KwZfyGLxblp+mM/REGthT
	Qwiix+IhIYSqUPcGz/Gi1ye/s/6gOiwnwhANWcPbJGvxO3bJYjlzo0DrKP/DKy3NQ
X-Gm-Gg: AR+sD13DuGuMNXPqHI90eLn+l4ptXX2jj8yHxsKxV5+bUCXXZF60jmGwZ4SeSkauJdP
	VEnbPqxH6S0kHXG118tIbbY6iQOYsAQ360q/0JNhNCeEt/d9Ob6cDs24IM8pQ6xHAtOWnCViwKo
	j75wUDGBsY7BWlH8UBTY1J2kklmZ+eMfEEGIoXgoFdvCQidPrBptULutgy9U8mfg6g0ZlgtnCzE
	XhczvcOoR0z689PPSCYxBdeNXg+oyVQS5L1lziaaVcM5QYM8xMw4FTxh2IGgutFq041q9lZ8YpH
	6DDO0dwRuhpOpMIHMi9TyqkJWEKAWaTutcmkmLSJMSTNQhmjaav8Z4AyMdvBcFvSLqkBBPVQyPF
	GoA813pguyptfHqrlp2A4cvY1Zca3TVzLIajRdMwVuFub8JdsEehhI94HZSpgxJc3GlhMwZiwI9
	wR06xzI6bSg6tw
X-Received: by 2002:a05:622a:2589:b0:528:3ae6:14d6 with SMTP id d75a77b69052e-52d648429bbmr37300531cf.36.1786538770099;
        Wed, 12 Aug 2026 05:46:10 -0700 (PDT)
X-Received: by 2002:a05:622a:2589:b0:528:3ae6:14d6 with SMTP id d75a77b69052e-52d648429bbmr37299941cf.36.1786538769623;
        Wed, 12 Aug 2026 05:46:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b44d0478d1sm479316e87.72.2026.08.12.05.46.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Aug 2026 05:46:08 -0700 (PDT)
Date: Wed, 12 Aug 2026 15:46:04 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>, stable@vger.kernel.org
Subject: Re: [PATCH 04/22] arm64: dts: qcom: hamoa: Reserve low IOVA range
 for Iris
Message-ID: <oeiqgw74eede7d3l42fgpplvk6lscpx4kjzj5iae6vrrgsxomi@wnl7cnon6rty>
References: <27f0b033-e940-4369-aaa0-f08426aac73f@oss.qualcomm.com>
 <tdgbfewnlj3xypfnyckivnd2b6667laapkcfs2vpnk74bh22aa@obasatns3jfr>
 <MHRdGybtgutWtIo4EOZisrGdCVgOj7AdOArjfuxCXTTNcc1o1v40eltpkDUqZl5sOY9tjRFaY6tc_OKvzrYJ4w==@protonmail.internalid>
 <429d5d1d-92d5-4949-9991-b092cc7e9937@oss.qualcomm.com>
 <181b02e3-831e-4461-9327-ab5646380a10@kernel.org>
 <73b26356-8ccb-4a81-b626-a96de5b13173@oss.qualcomm.com>
 <v7vlh2lgvluvacmxora6l7u5r3cbhr4xaqqlzqdli5jympfwxl@5qsqc354n4u3>
 <g_hgO2Ky6WOywvRuvLUE7DXb-e7Kb8S3QoVsLbN3yhHbYzryQwZBT0VLRe3C4iVy8rUA9Tvc1Vu255IjAnbRJQ==@protonmail.internalid>
 <7caa7fd4-6732-4c80-8b8e-a0ed99631ba2@oss.qualcomm.com>
 <6906ca3c-03b2-4d9a-a3b6-2d38345d8534@kernel.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6906ca3c-03b2-4d9a-a3b6-2d38345d8534@kernel.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDEwMyBTYWx0ZWRfX4klOE1VU6DRm
 5UH1IpYVGg6bs/P72Wp3F9zwy8pBiI3CXVFgecSRqY4Zt4eNrh0lK8q9cR076hEbj0TXvMElOOX
 m2LvA5XLE3rWGUb7qHeQ56JlErzXvQU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDEwMyBTYWx0ZWRfX3r5C6G88ARxp
 5cs/JAnSfcZy6MQQ8jFeBqKI+aZuXKFORYqdVYhQv+S9ctMhS12Ol7aCKxZSnzdmlkhZoTBP+6e
 jW4LrLqDZDSrr28VV0UzTS3rc8StDP9itLAEa07Sep88WPJMTz61jgzSMPdnIMQS7+Sw11Fi8Ir
 bj6tZGcESAyvsySv+C3QVnJWtmc241rsJp+Q/r0qHgmdDydZX/+uLjmp2D0EMBBM7tUWo8/XolC
 YleTETRDCeSjwgvFQhHIomWrVWM9pJ0RXULr1najmJb7nHBtPVCAXWWLjmy1rYkFAgIqFzMqJTV
 BC+VQ/Q0wfNlIaFigKOaANHTeI0+ydygelYdJHR8mpSJGZITK1IaehxQYvU+wQXhIqWiZ6p9o4L
 lLHk23cGdrQ9BqKBR89Qa4B1ZtJZyd5VpOR0l8ccpBn1mtlfwbwpnKqV/LB7dBEDIc9xOpLTeW6
 kRO1+YlBtjVIZwGSzFA==
X-Proofpoint-ORIG-GUID: l91ZJVOUp6FJ_I4DfGvMm9T7vejHBfLC
X-Authority-Analysis: v=2.4 cv=POA/P/qC c=1 sm=1 tr=0 ts=6a7c6b13 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=gl3J5UnCWOw9tU21VO0A:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: l91ZJVOUp6FJ_I4DfGvMm9T7vejHBfLC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_03,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 suspectscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608120103

On Wed, Aug 12, 2026 at 06:02:58AM +0100, Bryan O'Donoghue wrote:
> On 10/08/2026 17:57, Vikash Garodia wrote:
> > 
> > 
> > On 8/10/2026 5:40 PM, Dmitry Baryshkov wrote:
> > > On Sat, Aug 08, 2026 at 09:18:42PM +0530, Vikash Garodia wrote:
> > > > 
> > > > 
> > > > On 8/7/2026 6:48 PM, Bryan O'Donoghue wrote:
> > > > > On 07/08/2026 11:22, Vikash Garodia wrote:
> > > > > > > > > I don't like the idea of this series, because it_again_
> > > > > > > > > doesn't tell us
> > > > > > > > > the truth about the hardware. This typicall ends up with
> > > > > > > > > bigger problems
> > > > > > > > honestly...thats all the info i have about the vpu hardware that it
> > > > > > > > restricts non pixel to DMA from the 0-600MB range. The same i have been
> > > > > > > > trying for a year now
> > > > > > > You are not honest here. You also know that there are secure streams,
> > > > > > > which have to use their own IOMMU SIDs. And some of them, as far as I
> > > > > > > remember, also have memory range restrictions.
> > > > > > please read the commit description again, the answer is there.
> > > > > 
> > > > > So I don't necessarily get all of the detail out of the commit log myself.
> > > > > 
> > > > > Could you give some detail to address Dmitry's point.
> > > > > 
> > > > > The question as I read it is - are all of the other potential SIDs
> > > > > covered by this change ?
> > > > > 
> > > > 
> > > > I get the query as "secure streams also have their dedicated reserve
> > > > regions, so how does this approach helps" - This patch does not reserve any
> > > > IOVA for secure streams, only the forward looking subnode can assign
> > > > specific reserve for specific streams.
> > > > The patch enforces a common IOVA across all streams, and is good enough to
> > > > fix the problem we have w.r.t device reset.
> > > 
> > > No, it's not good enough. It defines that both non-secure streams use
> > > the provided memory range, it doesn't provide a natural way to later
> > > _expand_ it to support secure subnodes, etc.
> > > 
> > > We know that there is a problem. We already have been bitten by not
> > > describing the hardware as is and using band-aids. Can we now learn the
> > > lesson and write a proper hardware description?
> > > 
> > > > 
> > > > > > > So, if we land these patches, how do extend it later to account for all
> > > > > > > of that?
> > > > > > > 
> > > > > > forward looking design would be subnode, which we can land ontop of this
> > > > > > series.
> > > > > 
> > > > > Yes it should be possible to branch to make subnodes work on-top of this
> > > > > - accepting that once this lands it becomes ABI and support for this
> > > > > method must be sustained, even after sub-nodes land.
> > > > > 
> > > > 
> > > > Thats the plan. This goes as ABI with subnode to land on top of it.
> > > 
> > > So, do you actually plan to support both ABIs? This would also mean
> > > moving reserved regions to the subnode.
> > 
> > How is that different from moving the reserve region when stream IDs
> > would also need to move, so be it for the associated memory regions.
> > 
> > > What prevents us from landing subnodes straight away?
> > > 
> > 
> > You are well aware of them, but still asking the same. Reasons,
> > 1. We have been attempting the subnodes for almost a year with multiple
> > pushbacks from multiple maintainers. We are closer and working on it to
> > post for iris, followed by venus, once review is acceptable for iris.
> > 2. Current solution, in this series, is much easy to apply for all
> > kernels and can land faster so that it can fix the reset issue we have
> > for already enabled devices.
> > 
> > Both from timewise and simplicity wise, this proposal is made to address
> > the reset issue, while subnode can land ontop of this, without breaking ABI.
> > 
> > Regards,
> > Vikash
> > 
> 
> There is another solution.
> 
> Restrict multiple concurrent streams in both drivers. The failure mode is as
> I understand it only triggered by _concurrent_ streams so, restrict that
> case in the .c code.

I think this might be the best hot fix for now. Very local, very
presice, touching the driver pieces, letting it to continue to exist
even after the subnodes have landed to support the legacy case.

-- 
With best wishes
Dmitry
