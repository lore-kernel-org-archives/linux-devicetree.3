Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DDB72628D
	for <devicetree@vger.kernel.org>; Sat,  4 Apr 2026 19:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775331074; cv=none; b=YBUuNrU4IyEAvQlXKM7ONyDrDxhbb2vEKTrtreANSFvmGdHtvB3qxX5ZavSkSEItVZc+eIWdIeBPv1N3lQDfilNzi/rCXd8QcdWoprWzY7FnOp0+yjOHWu1VApe4Kqp98u60UPzmAnB9PWmeIh1LVufgIKQzpeAM4XbwoZwfWU8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775331074; c=relaxed/simple;
	bh=LSx9WTzV44rNY0Dbl8hoAX6cmBv+s/gox6Q9nQ7XLpU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iHrh6rqR0asgV+eytsKRyMKRjiTifpBe6tPCf+PMEgZRZJyUI03B6hV9mD2NA69BL6rj+s37FNYqGzLX/NJYkAD1cxm/WmnlRlGNA38t6VWMqf3wlAAFskAbC+FKxVL5FWdxXGKuKJWqgDM2cIP24qlwexnKwUlpbXbIGZxWJtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=e8bMDwrm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y2QkDFKw; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="e8bMDwrm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y2QkDFKw"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 634ErAvI2142137
	for <devicetree@vger.kernel.org>; Sat, 4 Apr 2026 19:31:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=M0hspaMhz5L3e9U4dgwg5Gv8
	XugdZo31JAxgaxDLXww=; b=e8bMDwrmo9j1UbbwJWRU0kUYSvszPE9eAWoboFF9
	die7cvmTepvSa/0ElwP1d5plnaU6FLqI4A96bVfyZi5prx6tbLixkXSOVNXN16w/
	+4385KgCtzibsdIWwG369z0/FJd4xCxvH9gA0Dz1SRw+b6w3iSS9kjaaNZzuDf/x
	clx5w5P3Cg/i1Fi07oYqEAo1PUwPHrAGglXJnUJTf1Y/JSiiGmd7iMxvpu3jtkgq
	nB0yGdWWTBXjZhLwARsbFZKZknHlgLnzONPj1GVU/8r14rsqrvTFYJv6alqqauWq
	YW2KJxzCTrvu3IfU3VmYxZPh0O0avGhSszC7d3ADlp/Syw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daux898u2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 19:31:12 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50937cf66b5so131971771cf.3
        for <devicetree@vger.kernel.org>; Sat, 04 Apr 2026 12:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775331072; x=1775935872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=M0hspaMhz5L3e9U4dgwg5Gv8XugdZo31JAxgaxDLXww=;
        b=Y2QkDFKwI2FeODyHlLR/GGqexhkZCARHfILnPfh/CyQ+7UMHENo+2xiOQiebVn+fD8
         xqeovunw3zWtt+j/OiL5jdHvtaTtF9VP1Km8b+IeBdncwonDcSR7ATIBpM7w5BAx4L/T
         mjdLIX1heyH2DHfMFLhTDAsfYOEfs67vKizx5RNSk/wRJIrWPVrav0+91ZR+DOhUnqyg
         O0c16qJz28EIKbwhsX27/e7uybL7dhuhauSqnsJu22Nrdgwqdkid8t43PYeLOMWCvOhz
         dXlOChINK9pcfbG92yT3mgupf1AbeQfK8D1Mb52tgE0LxGqb8YqZyQoTLnlupiaBO5YY
         TqJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775331072; x=1775935872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0hspaMhz5L3e9U4dgwg5Gv8XugdZo31JAxgaxDLXww=;
        b=JIjNlNjT4oibLGkX3zLCCpOzlXY8vSHNRXwo9QXUNurykfXlBjUlVr9Iqjb8909I61
         mUyfaCE3Ag8LQWxVzQOPi7m+/1ktjOTjJoScuEXr+C4cafaOuqpUZURZO8HJKrDe/OK/
         OOWHaxa3t3VO7kzKoGbVfJ+wLu519R/0b/A/cPM36WlchcrBGgDtBADkJpg5H9oftV+A
         SOmWaAR+VJZoq/IRir3BS6ovfnW5N4YzUyz0aaE3TGD6ZiN3XITtgLbds0okmoqLsmU8
         ef87qSBhUdRbJP1oZuHk9aS0ZbYwBpcELSISJ2jyf8Q0vBfZ4NKC2IxCxvz8QXi/vmGF
         BCTw==
X-Forwarded-Encrypted: i=1; AJvYcCWQUny52g6G1d/MQ8HZPe43U35MtUYe4hSaxs23ncKEZEyqycJ7Kw69OsQLZYLdBD3NeTV+ePUGBy5W@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5yKfUhemx5rqgsra4JG6TH1tNN0gooJVgMgrJ4Z34nwiD2SD+
	5qcTc8/onENdTKAVrn7Dmkv2UHoBzvH2IlCbpX9GnwCwF9k8hcbaAZWDsPaQgI18q7uRBqknvo7
	HeCjyQ2Hn1/XU357odeynowAU06kkTcZVAN7qQDH/9EzB21QAGBTQeWTNDrRQBZ83
X-Gm-Gg: AeBDievguwVZpqmzisL4e+TspNE1pxhXjp7CqVqcYug1nPp2lwPBTO0406O3tUOQzI1
	F9115OG/vn6szHoUc9xYc+U9TgMyUxKq6UzLTa7WwrvCwf0XGn1WUrZuSnYLC4H1P5pM1L02xlw
	Y0QwR5w8HQ4oJS6wqO7v2lq/pJgxg7mPxPTHMkrYSEeyPzyTXjG4UXdG0kh5TJ8DWobuiLtjiin
	/iZZzBrKBraHdEAnzsme3W9AjayAQQ/sQtQpYdiuajV+ofmdFTe669KWbWrBGeYOqbeFYBUdQjt
	n5q7V7DM+sajpjRWcLoWSS5dwXZVqsaMeyJgrj4ogHtGuLMWAxGHEcbIHUhYI1V90pY8s63GxnJ
	VChvb46BeEn4KH6dkK+rU6R2iHKsa7S9RBWMTggWsrmkPqEjJS92Dr6JZ/48RbCc/L4UZ871Sw/
	a5/5gsLoFpdflxeNeL0FosCv352rI1dVuVazg=
X-Received: by 2002:a05:622a:59cd:b0:50b:4dc9:3488 with SMTP id d75a77b69052e-50d62a80f05mr114152901cf.45.1775331071560;
        Sat, 04 Apr 2026 12:31:11 -0700 (PDT)
X-Received: by 2002:a05:622a:59cd:b0:50b:4dc9:3488 with SMTP id d75a77b69052e-50d62a80f05mr114152571cf.45.1775331071131;
        Sat, 04 Apr 2026 12:31:11 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a2c6cd3509sm2306712e87.75.2026.04.04.12.31.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 12:31:10 -0700 (PDT)
Date: Sat, 4 Apr 2026 22:31:08 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Cc: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Ronak Raheja <ronak.raheja@oss.qualcomm.com>,
        Jingyi Wang <jingyi.wang@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH v2 2/3] arm64: dts: qcom: kaanpaali: Add USB support for
 MTP platform
Message-ID: <b7fpqtn2qq5uqeqzpoeelizexhfhqry5i7wreecgj4t6g4u3va@glp24l7t33sy>
References: <20260329175249.2946508-1-krishna.kurapati@oss.qualcomm.com>
 <20260329175249.2946508-3-krishna.kurapati@oss.qualcomm.com>
 <10a9a474-7612-478e-9fb2-85b7b01ec7f6@oss.qualcomm.com>
 <n5pxrfwgqdg62p5s7mgxmvx64o4mon3wlys3nxzjlcq5v4o6bh@3gl5dtfctmvp>
 <09c50a08-e8d8-49a6-9726-d01829ad96ae@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <09c50a08-e8d8-49a6-9726-d01829ad96ae@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: PR9G30-mItYjsTK7l5DjcSN5N0t6rr0I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA0MDE4NiBTYWx0ZWRfX2MdLK05PVMzK
 PZmUTvNFkTfxhiwYRef+JE20DCUcbi3cLpyJspb2KqNRD2bX+qjShYCKWgR9s4ul8EYvZr7GBQv
 3Psi3L7xze5MnZwpKBQjGXG7JYzADLC2sS/IzGv6JwFNrNjMKeuJ8vNqoigFyrAGLQNAn6cGF7a
 Rj06JqxdHiYxDWxpI18HqtfzKLOgp9ZZDZis+tQqOSAlHkE8MHCNPJBWoG3Ge+disSlWJ95VvmT
 BmxfvXduaBzSb8NJEvA2KirTCXcIz6teHhfqZdQu8iArG2IClZQjprFqYOXHSFb5wZMI9E14DGH
 RObnIve+0rwGLZV0U9GJdQtVlAnD7j0Zn9LTwDgjSct/doRuNfa2HNlkDNmMSf3V90gCs6edwL5
 C2aiaOmWfdN1s69i/ne3RxRNJhDDw5Ua9Lwdvkw4kHfl8hPMN6STfMiEslcQ/m/P5oYAqfOhAu3
 F8pcd9JAI8eXILqZvCA==
X-Proofpoint-GUID: PR9G30-mItYjsTK7l5DjcSN5N0t6rr0I
X-Authority-Analysis: v=2.4 cv=AuzjHe9P c=1 sm=1 tr=0 ts=69d16700 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=dKYsdM090wwGdDnEZ2kA:9 a=CjuIK1q_8ugA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-04_03,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 clxscore=1015 lowpriorityscore=0
 suspectscore=0 spamscore=0 impostorscore=0 malwarescore=0 adultscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604040186

On Sat, Apr 04, 2026 at 09:41:16PM +0530, Akhil P Oommen wrote:
> On 4/4/2026 1:50 AM, Dmitry Baryshkov wrote:
> > On Sat, Apr 04, 2026 at 01:39:50AM +0530, Akhil P Oommen wrote:
> >> On 3/29/2026 11:22 PM, Krishna Kurapati wrote:
> >>> From: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> >>>
> >>> Enable USB support on Kaanapali MTP variant. Enable USB controller in
> >>> device mode till glink node is added.
> >>>
> >>> Signed-off-by: Ronak Raheja <ronak.raheja@oss.qualcomm.com>
> >>> Signed-off-by: Jingyi Wang <jingyi.wang@oss.qualcomm.com>
> >>> Signed-off-by: Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>
> >>> ---
> >>>  arch/arm64/boot/dts/qcom/kaanapali-mtp.dts | 27 ++++++++++++++++++++++
> >>>  1 file changed, 27 insertions(+)
> >>>
> >>> +
> >>> +&usb {
> >>> +	dr_mode = "peripheral";
> >>
> >> I can see that the usb port in the MTP support 'host' mode too. Should
> >> this be 'otg'?
> > 
> > It's stated in the commit message: OTG requires glink, which is not
> > available yet.
> 
> If the issue is with switching between host vs device mode, isn't it
> more useful to use "host" here? 'Host' mode does work on this device and
> I use that to connect an ethernet dongle to ssh.

Another issue is VBUS. Without UCSI / pmic_glink control one will have
to set vbus regulators to always-on, which might be bad if it gets
plugged into another device.

Last, but not least, sadly enough of people ar still tied to the 'adb
push' mindset and workflow.

For all those reasons the USB is usually brought up as a peripheral
first, unless it comes together with the UCSI / TCPM implementation.

> 
> -Akhil.
> 
> > 
> > 
> 

-- 
With best wishes
Dmitry
