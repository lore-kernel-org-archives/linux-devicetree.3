Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCD663B1ED0
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:57:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782507474; cv=none; b=GDuzZ7d0PIgzTXXsrM4XgJAe5d5Vff+FK4T1LIpX4bOBGDQs0z0GSaRCH8kBLIKjSZgLV9amP4M920ywWg/Cz1gMb/7Uo6zBcouMBNyt1Q+N+wxMWWNv5lsboQTSo6uM+dmmK0lPnRYOL+G+gu3lJoOToDAsWADIvNQKlp4xDIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782507474; c=relaxed/simple;
	bh=1Mlqdx0yALmjRxStf7R8xHxhf5GtiIJdHJ/PGKKoFS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ih1xs9QkopmloQDv2ta+3VUJBROhCb43KqI0LplvXTsVM6zK8ZZkdKeiuY29wSzX4pWLlxq4g3B50ceW4ms/mdRsjon/g79PV54UojwirywLbeBKQ8KJiBWcz1pXfBWB4bUdPYk4dzF4O/Pg/durjd/0uW09Zq5B76828bIrpuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=j2Xcs9rH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CaQAi7O0; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="j2Xcs9rH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CaQAi7O0"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65QJ8aQ91729739
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:57:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=yd7du5bvNXW9tUAU2kTjwJsr
	b2hTJirrDWb8BV4Ma7c=; b=j2Xcs9rH5ijerF/VZLQstRSueiY1yoyk0h05sPev
	MSHTJ9Lk5WDThq/f+Q55ViUkCvHrZ1gSFVddqPTyD/VBehY43Xi/D7d+LCoq6dwG
	dWA6KkwIDLJkyhfQcDEJyC4IM9pX8Yz2EF6EkMsnsjmXDka+iP7dybiWFt1rjU+h
	J8QFvdUdQYZVub2fvKeQLwTpDY5iRx+SMriiq1u4dUoIupdoLWJgYPNbYiTWCHqi
	g+zD9iOFlbk7GnUvhQSqoT67qSzYoHKmx/AH4QTC5MkKw/OEk4Sd6cadcFVQ3q94
	RWTB+9p96rpqGFkxNjzQA4nx61b0P1iLhyBZ4y1ImeRJpQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f1t0qspns-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 20:57:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-921ed86ddeaso300476985a.3
        for <devicetree@vger.kernel.org>; Fri, 26 Jun 2026 13:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782507472; x=1783112272; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yd7du5bvNXW9tUAU2kTjwJsrb2hTJirrDWb8BV4Ma7c=;
        b=CaQAi7O0pJRlDy2DxBfFupchhfmCZ/1nnLmPYxGU5d1SC3DApgZkiS+fRJ5R3SVGG7
         w4a1nZtnDPNPk3a9Fn665leMsRxScPEtzrDe8H1NDTvPkaLDMXEa7TuJ2YFIVEIYVxf6
         3nNkVsgfMgBBQJecAssyuDXNjzW7G2fpyLOuHUs6nPp/noeppMORv26aRjCJajaR2yNc
         xOVsUy59OlXbkuvcJ7AMYbzz/cKKgnGfl7lJKLJnFlMRGc9ozq7q9zoHiwQONP51Yyyp
         CUJD2CsKcmACR5IeofbvfBlkJ0reTG8dYlC4wtA+GKtp0j/Rvwg4wnL746jiu+lNrFFA
         uyoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782507472; x=1783112272;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yd7du5bvNXW9tUAU2kTjwJsrb2hTJirrDWb8BV4Ma7c=;
        b=Yjtvp506CP//o6QeygPs8dQuH4U6a6Ykg6uXi1W/GMIf7l3rlYpsYLj36AOK93trvl
         nunsxVTNfyQ0ZnHndupONvRwjWmxPv1lK76QbFFy1YXLV4NzX3itgUZpeR2LS+g1F9Qc
         FAYYlbeRSK/9qwuw9xXEQbtZhSax+U3Mv3oAZksPNuOIgZ4eipHSr3FeAWJZnXDxFyqA
         O3uT/Vkt72p7Z8wuL1X5yKLaQ4WtYWWBXYjmC1/oZ+/B3mE7Zh90qM0ZcDkhW19A07dc
         ffkuk6K3nrQyaXrVqmLUGt+mMaQZ0aR4VZAHJFpMY3n6lIVSUtDXYIpFooX5nYhDsNx5
         7tqg==
X-Forwarded-Encrypted: i=1; AFNElJ+NE0nhiFzBCJqOc2PGNihOMCx1OOZIOyGCbAJslABsOk0vmSLqpO1uAfAqTBIJLnNlnZmMv08AxbN3@vger.kernel.org
X-Gm-Message-State: AOJu0YwcSnWq3Sd2LH3h7QQEzoOphoKiwheM9ExmbV53OyFzVeniDvtX
	YiiEwQpMfng4Th/VAe7q7e1b0kZttKnrXo+dRi9K8hgd/pDgdbEP05ThHompQiT/D9kYK3iPzTz
	2OVUKJvE1byDCBkyjTN0UJWsT0ohb8q1m1J5e0hEnColsU/BLB7e7c5n602g02OGcs2B60P6e
X-Gm-Gg: AfdE7cmi81H4rHZWbFWfTiHibJDX4I8j2lHspskxaGp3WXxOeCWaivG15AD54ikyyRI
	7ay4u/BWcszc0VlpZUAVWM11umDizDVb7BH51/2RPs+w2rwRBiRADbxO1g+0wTAziG3/Adr9pb+
	dYmll5RZf1p6gO6+xOH+3z/K8jA1G1xGP67X37sxkdaEBMIyRQ91Dfm1W3BawVMf1mtWnPH88yQ
	LCVFnXsIkBsGcMoU3bGb/+ZMl7tVQHVaLA7Sd/h1Fvgq8RO93IQEBJJ7n2ISmKKudPPr00/AOBx
	Zy2E/PlfdjfI2HiNxnLyxYI13kvrj5iKuijqhy1q3EMNzlW/3M189ts2oj2+9np9QVx6UZR4R+S
	4CBV0fVcOJLulU+q0akJBNCIEhP5dxzY62loj4IkSkqWWX08SX+vkjjFnNce6/2yfjobq0F8wl6
	4aPCmUEZTWOqgH+lOs20FmddnL
X-Received: by 2002:a05:620a:6302:10b0:92a:9d2b:1ccf with SMTP id af79cd13be357-92a9d2b265dmr434981485a.36.1782507471881;
        Fri, 26 Jun 2026 13:57:51 -0700 (PDT)
X-Received: by 2002:a05:620a:6302:10b0:92a:9d2b:1ccf with SMTP id af79cd13be357-92a9d2b265dmr434978985a.36.1782507471408;
        Fri, 26 Jun 2026 13:57:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad69585a76sm3638337e87.74.2026.06.26.13.57.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 13:57:50 -0700 (PDT)
Date: Fri, 26 Jun 2026 23:57:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Srinivas Kandagatla <srini@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-acpi@vger.kernel.org
Subject: Re: [RFC 00/12] RFC: Devicetree-ACPI hybrid mode
Message-ID: <obvpvyx3kmzcdc5nxmx4inlpiqugjxdgzfzmdxzfqqy4qqwt7l@y2zyrtso6yk4>
References: <20260623145225.143218-1-johannes.goede@oss.qualcomm.com>
 <20260626-friendly-ammonite-of-holiness-aabefb@sudeepholla>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626-friendly-ammonite-of-holiness-aabefb@sudeepholla>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI2MDE3MyBTYWx0ZWRfX6o/F3N3x6xkJ
 clF+FNPt9Ybg2QYvgdGRNoYJv1doznBiBxI5TvtqCxxlJ6qg7fzqPKOjAhXSFlOoRhSDdjACyCH
 4tmJaaZZGvh8A96ETCOhA5Uk5Ycd40o=
X-Proofpoint-GUID: vXqTgfC-bKO92hxT-SHVhjiizY4_WYof
X-Authority-Analysis: v=2.4 cv=StqgLvO0 c=1 sm=1 tr=0 ts=6a3ee7d0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=NEAV23lmAAAA:8
 a=Fl7lxUCT7PhOQckEiWcA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: vXqTgfC-bKO92hxT-SHVhjiizY4_WYof
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI2MDE3MyBTYWx0ZWRfX7EQeNQOngutH
 3I3sLoUmqAmjZeL8cpx8VdN0lIqHzvWV8N3kaPXb8/6uW2h7hCr8fbyZx1T8XO5/kuqASStQqK2
 N6iiWKvkLXiM9qdMgEpHW1NlBA7SmPpTMIEOjD1SWPxliW+7PXn/ptW3QNzScmW/QIu5OtvEc3e
 z2V/bCYn5No3UJ4smi0xT9zyeigYgYNpcxQTSFwPE1tlmWtjsAaAW1KtH9chc0gUDL8oplGQd8z
 F2n8DAMYF59NVhECyHGG3F6+5b8xF2yn2KrYjg91//YwVAchFdEPufI5AOn+q9Yypz5wHauabKA
 jMteVB8MRtF0UFtIMT0d92NPeKgJfUMD7VtlTi4ioC/iNC1VwNWj5cve0IlGoP8XvEzYs8Nf+vV
 8ArG/z9Z+TBEteD/cchIxODGa2pvJjmGSbM6gsJ8mujZ+pXGmJK8+zt48gt72NBK9U/dNTEXEmh
 wDI3p4WIYfwOGuQ4y+w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-26_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606260173

On Fri, Jun 26, 2026 at 04:52:41PM +0100, Sudeep Holla wrote:
> On Tue, Jun 23, 2026 at 04:52:13PM +0200, Hans de Goede wrote:
> > Hi All,
> > 
> > Currently as soon as the kernel boots with a populated DT provided then
> > the arch/arm64 code sets acpi_disabled=1 and the complete ACPI subsystem
> > gets disabled. On WoA Snapdragon laptops where the factory Windows OS
> > actually boots using these tables this is not necessarily desirable.
> > 
> 
> I am bit lost reading the very first statement here.
> 
> Who is populating DT and why ? It seems that is the source of the problem.
> 
> If windows can boot with ACPI tables, why is it causing issues for the
> Linux kernel, any specifics?

Windows uses a separate beast called PEP, which nobody wanted to
implement for these platforms up to now. You can find a lot of ACPI
dumps for these devices at [1].

> IOW why is DT populated which creates the problem you are trying to address
> here.

Most of the laptops resemble other Qualcomm platforms, which use DT for
hardware description. In some cases, it is the same platform being used
for both mobile, IoT and laptops. It was more or less natural to reuse
existing support.

[1] https://github.com/aarch64-laptops/build/tree/master/misc

-- 
With best wishes
Dmitry
