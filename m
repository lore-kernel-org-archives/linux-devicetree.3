Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F3DD541E51
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791988405; cv=none; b=qtWiRMGUE1YDFy30pdWCzGZ5vT68kb/cm1EF9DaTpXQRGfCv+bGT7SAcIFaBy+FSwYwrgQjr23ge2r8rNRqN/9ug9NClghRjsrax51oAJh6ETXCh3bLWf4S0KgCl9VuGDYN0Nrm8cIW++GUck9zFIr8kKNAaLuJTt7V77NdxwQg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791988405; c=relaxed/simple;
	bh=GhAP+Hm1mtY78lJnS460+USnW7WTojwu9rQ00L+MIyY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gKUkx5TdngGHEsXecI9xoDQc2gpehQFhs86xzzF+A+ff+7hhWopXj7tW1Eix7hYO0SARBKbHzj0O2Npl2+t3FjjHBvKGnrKQJqwBLcRlxkQFkimchSwQ2ngqGSR+q38I69PLZkD80m9hbbbIYKn/Yg9eWz1U7oC09VJa4h1LoUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=o5U3zAgV; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QlFN1doC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="o5U3zAgV";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QlFN1doC"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69EE14Xp3017940
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:33:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=J0wSqsUrhEenMN1GPGlX0XTU
	gQq+Awy3xS3qfY9XCFU=; b=o5U3zAgVZ4lsBCE+vkZEu9eJPIggjjOoB+7zuilZ
	fCrDe7aclAZi3deeEt3ymrtULjxuskB6vC3ZQ1qpS05XyPN9EvCfI3YlKsEBSF8f
	pKXbRe59uMvF9UWwEOqdjrJdStZZq8HV6z32B+nIIgf2xZhHMMiG6dqJX9clzBo6
	0uF7xxCiTNaNiUIMRjjyo+BGOn5ns/0o1Ap0qJf5Z2L0j2P6iZudcNHPPvldJ2cU
	fmzAL2GY12qXqzaW/ezXR6w7HwZUV0ePNu8PFrL/d5yVw1PzDH2yGPsamuhNI2HS
	Hlja0Nj4fDccRGfG2XDku4JwDAP2PFBpQ9xoGgiffJuHBQ==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h9s2b4sp9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 14:33:22 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91256a7b7b3so6775336d6.2
        for <devicetree@vger.kernel.org>; Wed, 14 Oct 2026 07:33:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791988401; x=1792593201; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J0wSqsUrhEenMN1GPGlX0XTUgQq+Awy3xS3qfY9XCFU=;
        b=QlFN1doC2JmM1xU1D+lEKxYz4maPdB0Ga/eHZCciA2KBqW+h4iLeMtqbolnOxgk1Kj
         pEZFMmv9JWH4d6JT49tAsb6nnpO7UHqbZMZ5unTHlstqqfSapiEMegcfj+cUZt+TdB0z
         3kYgPgNDfVvw/aJm4+w1UJwKNXI0CxZIJaYr50ub32pjCFesx+LWBgqxC3Sxz1sGwRw6
         ReNJcT1hSdKiWocu6q2iVmL54gxeSLdXoQYSs8/f1kxpSHUt2XfGVDVaBmzh0TLgTUhA
         foRJCK8GPItfbOvmLnbKBQJFtMgmk0oXF/DoZXSgIG6rMgXo+YyxAacyYr2xK9pzGpwF
         HNqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791988401; x=1792593201;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J0wSqsUrhEenMN1GPGlX0XTUgQq+Awy3xS3qfY9XCFU=;
        b=t/tFHNSvLYVZclLtbeCnnclgJrnEWL1Bp7UYVBzr26lte2p1lyOH+6zmO10YMOtmVq
         s0RnBbqf2v+1sEFBQDR+Uwij7Rc/w0cqHMYSUTxTmEI6dz11a8n/BkMB8LdG/B6Qt0Lg
         /UlOTv76FKfW5TQ1sY1kw4Nc0Pzuab3pPP/4U1yBkKduLffk+00TEh4ZCGAh5A6uLdIr
         /Dt3ONEErqbiuLaI9vNceevzDNAORgv1kArOqMXrA0j73Q9UAk0yztwJV/eTabB0yPEg
         je2XupsmXVyK0KBecvEu2xZ3zE+mK5lpyaKfYHLD8fHjo0ZmTVpmkwi08lGQq6lfHx4H
         coHg==
X-Forwarded-Encrypted: i=1; AKwUvBxXe/ynvCFuliWabC3dCYUM1vtp0o9An+ngmu5VRpLmNrTS6fcSho4vKheoLWCTDhikhaB6ZUTX6iRR@vger.kernel.org
X-Gm-Message-State: AFq9FYLBBsuDaplkVIMA50aDeeXDf7yKxORYLcKYrOoKtkRRsEWWgAk1
	MmihPatBtoJbVYZPDagmb6K/xMRYWtLRPGdr85kYdkXGI2qAHdWuv9awYr8EllSddwybwRlgysF
	xvz8QNTxHbDjrbmW9Y6ubqCc08talM0QRkYV27PiZfX3HQEcNDTz9D2pah3cBOeX0
X-Gm-Gg: AYBFou0a+9ieIr3uhfaj0UGaXfSLwZvbPuh5fFXRlqIDy8OeSDLEtZtIp4oLfIwV7Oa
	DmiSAlw/FhLvk6jdR9lTPp8aXkvxEFxhAUlXT5Eca/2bl2gj7OOUGBza9s0JCrpmGX0LzDL+a+r
	UDgSRHQLwb7QWz1PRZr3hCuHeNhcHWOXVpw1+yoPXkmy7ZU0d949IVOUgjr4nVQ7PrumBIJzHK/
	ZJNL3RoS0fQ84ow//7ik9HdonOpy6En7FDmNnWom/bNkO4w8zTd6vt0U5mmazdUJNPdmRJVjMrk
	s5oO88mWZP0h4IOX+6G4B/uzlQxEm3RnFRvZESPEivjCyIiudDFYTlFtNuKpc6/cjmeyRZSPcz6
	YvEKYGC+cvrfTqaAKKInQ1GEj9hMO25drqLX6Ad9xAmNpr05O8lAEz0BAC8F7G6LUoaU1zvRkyW
	DNREjwupKR8dy4
X-Received: by 2002:a05:620a:280d:b0:93e:e394:78df with SMTP id af79cd13be357-93ee3948ff4mr1516719285a.58.1791988400974;
        Wed, 14 Oct 2026 07:33:20 -0700 (PDT)
X-Received: by 2002:a05:620a:280d:b0:93e:e394:78df with SMTP id af79cd13be357-93ee3948ff4mr1516712685a.58.1791988400363;
        Wed, 14 Oct 2026 07:33:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be33c12b51sm687593e87.3.2026.10.14.07.33.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Oct 2026 07:33:18 -0700 (PDT)
Date: Wed, 14 Oct 2026 17:33:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH DNM RFC 13/16] arm64: dts: qcom: sm8650: Describe clock
 controller power rails
Message-ID: <lyeiklz7kcjhotj43wir7xutru5wmjbrwfwauwbyzx5jcgpito@uyryg2sbmsf6>
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com>
 <20261014-topic-qc_clk_dvfs-v1-13-3041b788e9f7@oss.qualcomm.com>
 <su6pmts36qj4hogxfthkrvjr2aod2r2u33onxifqanbarxk3tc@36qoces4rwor>
 <2ce49c83-b861-4a0d-8412-e8b3ff33bdd5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2ce49c83-b861-4a0d-8412-e8b3ff33bdd5@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RPQmjIi+ c=1 sm=1 tr=0 ts=6acf92b2 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=W8i7BNQISyomCxrj-lQA:9 a=CjuIK1q_8ugA:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: 6q9hK-_v2e99DA1zvNKp2m3IcUdzsDHU
X-Proofpoint-ORIG-GUID: 6q9hK-_v2e99DA1zvNKp2m3IcUdzsDHU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfXxpPtcd0iwxkv
 TAwXJZ1f5UAORGEBsplBWsDa1jg408J8dpPm1VSm85T2wHdAVEtsgQLyNXOnZDd7wX4/e0FCedj
 wwgJq4KR3l5JyQ/YNkRI2RyNu9nB1PMcmUdqQrIU+u+Rvah5jkhkE2lsREEEIFOB+gwwWujzRVm
 vwEMjs4jbkXAptGJAMMvzUh90WwMgf/ta5Kx8CqyiY5/lxbnmlQHcVO27GEzp9CtLGbTEl0JbPC
 AE3kUwzG5PaJybSiiPruHTxdPvqBfcDzMwMkAxzHpozGb5Qt7tulUmSiMigZ5jgOx5HNW3LqQ+M
 M8DhCihyDGEXqpiILtZWMOjI1KZRSJzbaOiIkN/iOSzjPd63DpJeYoSRuYjHh9+bRIe1YUcoRHA
 cyZsLFxG3VVATjXxyscSIVJ8823K0HC9wD4KbqyTlcPmX2OtjoAJULTubL2vrgN512/cCCuXmS0
 WBISCK6eZbn5UU6bKVw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE0MDA1NyBTYWx0ZWRfX/o7iDezYgEf1
 0WJmhs2Kp4TwUDK2IYGwcQ1c/6+DpUbKC+XybdE1G8ajjksiE4n7k4Q5NoN4YRGqGt/bXJQ1hoC
 hiRMbx0nDwTylnyBXUbwL8sQDqDUbLM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 priorityscore=1501 clxscore=1015 malwarescore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610140057

On Wed, Oct 14, 2026 at 04:20:08PM +0200, Konrad Dybcio wrote:
> On 10/14/26 4:19 PM, Dmitry Baryshkov wrote:
> > On Wed, Oct 14, 2026 at 02:19:13PM +0200, Konrad Dybcio wrote:
> >> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >>
> >> The SM8650 clock-controller nodes omit rails needed by their clocks and
> >> PLLs. Without those connections, the clock-owned DVFS implementation
> >> cannot attach its voters to all required domains and controller probe
> >> can fail before any clocks are registered.
> >>
> >> Fixes: d2350377997f ("arm64: dts: qcom: add initial SM8650 dtsi")
> >> Assisted-by: LLM
> >> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> >> ---
> >>  arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++-----
> >>  1 file changed, 11 insertions(+), 5 deletions(-)
> >>
> >> @@ -6049,8 +6055,8 @@ dispcc: clock-controller@af00000 {
> >>  				 <0>, /* dp3 */
> >>  				 <0>;
> >>  
> >> -			power-domains = <&rpmhpd RPMHPD_MMCX>;
> >> -			required-opps = <&rpmhpd_opp_low_svs>;
> > 
> > I think this is neccessary (at least on some platforms) to keep MMCX out
> > of retention. Even if we can drop it here, I don't think we can drop it
> > for older platforms.
> 
> MMCX exists precisely to let you turn it off, the clock patches
> retain a way to keep the clock on during the runtime-resume of
> the clock controller driver

Turning off MMCX is possible together with suspending the dispcc. If
dispcc is resumed, MMCX should be at least low_svs. On some platforms
it's handled by the cmd-db, where MMCX has a minimal value of low_svs.
On other platforms MMCX lists 'RET' as a possible value, however it's
not enough for dispcc (or other CCs) to work. In theory, *I think*, it's
exactly what 'GCC_DISP_AHB_CLK' might need to vote, but we don't
represent it.

-- 
With best wishes
Dmitry
