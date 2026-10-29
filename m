Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793258757;
	b=k9maS/yNjvdv0Vmk9eR5/KNghFXnEs51IReUxIFuf3hkbyCkoKeE9drBYSUncQNEEH6I
	 KgQhZM62UQk3Fb21ZcAPOkrzqw8TfbqTUUlQd+Gwrr5YkU5GkJy78A1HaBlzB2KT9EawJ
	 OEsChKiyIaxGFhhkZI726+tlaf5SrGlaAxDbJKPUbbJUGX/fQ5TEQCfbZqCXlYVkF82os
	 g4Fzdoo73X0GaunZBQ1Um1ZWpNJfp6N5Le6s1lgfy9+XYedRQc6RwoiB0VXPYPSQmBmN+
	 hoE0a9+KT6KqTWOwgrdoEZvAMyBtEcaOGwGJIfYJJIqShS+pU/As/EN/C0LKF7kjw1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793258757;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=DPr/ruBMl/5HBXMrl9bzUyjfwBosBgVuKL0NnKrAD/w=;
	b=nCZHDoFjt1JlYWU9aHRSxSyWqbNm+dFVFGDZUZgfGa+evEAGLnDhng+B79mDjOIqB5U2
	 ijwx4GmIzGvb5wqdwPrnSXlqHNKSR3tGgu78UG7L2YLt9a4sNnG/7en+MfAg28eYeAUEV
	 2ilnPMAKaKcval75CYUDwVLLnzpbwYjEt0nTQHY/w7dXAzGEhSvnI3cFBh/4viZvGv7h4
	 FwKIHbIQRMGRcrCgTTkbdEnYSD2hqYc0SSjEBqy0V/TqADsmaGBJ8axqeYZoJKO+ExiCF
	 /LGjYRlI7Gyj37fGsvKn/8M68Cy2W9GGCyFvw9YU32loXq3T8Tu51cBo+OEEbenU96Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WMbDXrgb;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdIHVoeK;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80256606A320
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:25:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80256606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=WMbDXrgb;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gdIHVoeK
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69T5HVhB1793320
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:25:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DPr/ruBMl/5HBXMrl9bzUyjfwBosBgVuKL0NnKrAD/w=; b=WMbDXrgb+uS8dEwt
	DjFQF79dR1ep6mfPqr4H1gwzFJ35mCShmfFtfCshkwKxnGD56fDCx74h8e2wh97W
	rUa4FlmajEarcIuR6Q+OO3UwbWTaBG9M7G6tyL1Hyk0eqXgQTmA2AN3GWQuKVLx2
	uuPrEMpRfmX4m6Tr6WGDjLPQ1x7AQUvqmUY4SG0SYM/XI/0BffHG5nfx7ysB/YC8
	bO4pu3ADHcqcAyqK71NzhqAo9uuMSs0oPGhhQQ+pSC9SbPPYP44ClEvwwflZF42E
	2sLRkxybcB5FYvZukMxQsiqAG6/QtMMz+nOS7WMD8yljtdKfQFO44Qp1vuXCS/jl
	NHaCnw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkhtnkup2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 07:25:51 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-91c7cb9e267so20746206d6.2
        for <devicetree@vger.kernel.org>; Thu, 29 Oct 2026 00:25:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793258750; x=1793863550; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DPr/ruBMl/5HBXMrl9bzUyjfwBosBgVuKL0NnKrAD/w=;
        b=gdIHVoeKna41szv8b6gp1libGUqEyqW3ALWQ4rVtsZQIBV93glOGbrGQ6SMqamphub
         WjaNDUtmE599S+X2SUdAZjaKP4wuWfMQA0ZD5mzpnYYNB1CZtnXYm9XWOO+GhbHNGeAf
         Z0Zk8HtjfO0GF/G1/w37i5j4QVxnBiTUpB20xFXxnK4ZnF1tiF2weP8YfMS6lm7L+xyn
         XYa/DNQ9xCf5uICua8u+hBiu3a5kErkUjDRdsWoB2vLdOO9K2qtJVp0GiEXQ6EfocPOo
         fA+nTMEYZnDNyvIKTI9xel0ZPoV9eiqg4LBU+XXKjTD3YNvbZNrvatNe660uGETAXmrs
         wPSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793258750; x=1793863550;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPr/ruBMl/5HBXMrl9bzUyjfwBosBgVuKL0NnKrAD/w=;
        b=FT4sy6NcfmLO+wODrZarki3OjWESLVeIM0FOBPBNkUPfl4o7BcO1edRLEoc4/KyMCP
         3DtvsoB94o296cJPj/A0h5jcmeJBPezpfJWigEPiv10pz6h//QE2PpErwecy4QcIaQxn
         V6LksCiYRQAF0ifCDMgF2OhaWVzPwriI675/68b1F+MzF4h03zBlunNi0I0CGdBYBu5v
         SbjqRSGZ2sNaILOuQFC05x0QY6KS+QlAiEtrcDvMF3L3Oe4J4ueNCwNRFAlAiBXp4Roy
         wcYaXTcm9TFhoTkK/u7qL01RtKhRsmRd0M+SDv+vUZQATc971xJ6SpVGwe0OY7rWLRDu
         cl3A==
X-Forwarded-Encrypted: i=1; AKwUvBx0lnBeDGhfIYP3K9FceITRHl2yYqwG2F6TLEi4xpfTzi5zm3S7LV/KoY9S51B4zoc8siibfSL+Nxuh@vger.kernel.org
X-Gm-Message-State: AFq9FYKV6fh4p4OdlLYrGlQLmtggWJBYYQ3mOR2pyjlnhTyt+HISh1MN
	srkKD3H2kcHitu1qFOziZCMHtwtjUk3GQvI/iO1o7BiXu4nuHI33W9SZB5OUSqadkzlCUkfoZnk
	N6S32yLTo4BwJnDadkOmzCRrPL9uD8bEqvy9q53mvRBJI70zJQ1xSOtZAxuXpGOLG
X-Gm-Gg: AYBFou2+PU+dLsk5QdzHZDCSbdcK//05egddluPwNeTvOCznJkGhGbJD3vPpuyekDqh
	8DZh0jR9F7bmtKHJQEa7JJaRRQc13OsaEqonVtesbQtKEK9MrVguJATxwrylA3NLbKvAkeySBIJ
	TcHBh4s0vRLrNt+pVrQbLtZDsu/JHB+Ma/bpODisTF4rVibjS1b6SwqoLoQtghgGLvLQfcbhm7x
	PQukDtWwqZRrgkXqorEgiFxcjIwHiJas46HrXY9ELGQmi75kgKgWepzKujC5SAWfOnNvnzveHkL
	YbT9EzKsUm85ioFAlR9WAmopndoKVVqhHuwZ3zqpfS2wKyLTlGESjizW6sVGBYeEhiLDRcp3pPb
	fh/1xTG9WBVzMz7wG4ho8DDk08SsmKhwCueSsDy003ubQElrjXboXd7l11vjyYlkw4PHLxofOSv
	4B/jLfbvnS4bi08Q==
X-Received: by 2002:a05:620a:284a:b0:944:6c7:c88 with SMTP id af79cd13be357-94408ce4acdmr614856485a.54.1793258750412;
        Thu, 29 Oct 2026 00:25:50 -0700 (PDT)
X-Received: by 2002:a05:620a:284a:b0:944:6c7:c88 with SMTP id af79cd13be357-94408ce4acdmr614853885a.54.1793258749900;
        Thu, 29 Oct 2026 00:25:49 -0700 (PDT)
Received: from [192.168.25.64] ([94.155.124.210])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e542ed998sm18038106f8f.13.2026.10.29.00.25.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Oct 2026 00:25:49 -0700 (PDT)
Message-ID: <d59a7591-b4ca-48fe-9f23-335e3bc21d81@oss.qualcomm.com>
Date: Thu, 29 Oct 2026 09:25:46 +0200
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: qcom,camcc-sm8250: add
 interconnect provider
To: Bryan O'Donoghue <bod@kernel.org>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-2-atanas.filipov@oss.qualcomm.com>
 <20261020-bloodhound-of-remarkable-debate-11afe3@quoll>
 <7ca815b3-4712-42e4-996d-4a1e53cad492@oss.qualcomm.com>
 <Sm-FvdxaOiXpzzGo30wECHdQF_-LtUaJCO3mGpBUxXfnVCYjOLE5DhNWdNmOMhYdkR1RMXhPzWuHhsZJkJ_Vzw==@protonmail.internalid>
 <20261028181040.3515955-1-atanas.filipov@oss.qualcomm.com>
 <f0618a27-cee2-4f39-a578-fcbf3c51607a@kernel.org>
Content-Language: en-US
From: "Gjorgji Rosikopulos (Consultant)"
 <gjorgji.rosikopulos@oss.qualcomm.com>
In-Reply-To: <f0618a27-cee2-4f39-a578-fcbf3c51607a@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: JwZx7uMfMgO0KiA4pVDAl3ffhfzLr_d8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI5MDAyOCBTYWx0ZWRfXz8w6v9mn28ua
 xUNO+odkWXepekrl2/XAaEWjqi+pb2TXe7h5ItZmwbnn7zYU77CPTjvQ0/V61LoLU+rDWpQsCmT
 FzlwqiZp2mnnXg7laqFJsRA5tpVjRn38n84C9ZzfG8pNTU1DOdzPo/YO41GkHK0hnYZ+2TvPp/C
 0gbwvl68tfD60xok4h/chS8s/NbGzxc83ApzpuJoLXnpKWqe0bEP1z/NJHGJgZdnQCOkMRU7ZwP
 Eg4l4Y1s0S5rIjMaZvW07H4AZdn6wEnRJxJbuNR3l43a3WhxJVRiVQjpcaj26WM86uUQdBW7neC
 k1Ima7MDrhwjyLOFlk1f+3Q9w8lS4kXHNi8r46rNAIsYwAfyVgbNZI49ZzBXfP2hWjHeBwzYtiz
 eRDBdsbQ+d1rRX4ThunI3ANpNM0JKN7wWfHgMv8o0Tk2nOXt0ET+wuX+Woy+7GZjUuPgsW5A0K5
 7MmpFqIdjxZBAh4bWrA==
X-Authority-Analysis: v=2.4 cv=c/A+0h9l c=1 sm=1 tr=0 ts=6ae2f4ff cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=eGCDHFSXubCXFTSSGhjuOA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=bB782UoiXxmDKwpK7Y8A:9 a=QEXdDO2ut3YA:10 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: JwZx7uMfMgO0KiA4pVDAl3ffhfzLr_d8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI5MDAyOCBTYWx0ZWRfXyaiXrJ0NuPOQ
 cTTkMN+hViiaS6wlZ4tkYEQqvmmZc58wclm2XggYxfCbk3LlhHA6dXcC6amXfmppvZeRPd9v5nZ
 B4GIPbOZGTzz4Vz9YbDgzkG1qTvlLOA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-29_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 clxscore=1015 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610290028



On 10/29/2026 12:00 AM, Bryan O'Donoghue wrote:
> On 28/10/2026 19:10, Atanas Filipov wrote:
>> What clock votes cannot express is why I think the camera NoC is an
>> interconnect:
>>
>>   - The camera NoC is a bus with several independent masters: the VFE
>>     write ports, JPEG and OPE. They share it on the way to the MMSS NoC,
>>     and the camnoc AXI clock sets its throughput.
> 
> I've always conceptually viewed the CamNoc as just another NoC that 
> happens to live inside of the TITAN_TOP_GDSC power-island.
> 
> I think the trouble here is the CAMNOC_AXI_CLK is just one clock, it's 
> not interconnecting any two things at all.
> 
> Noc entries in DT usually look like
> 
> interconnects = <&gem_noc MASTER_AMPSS_M0 0
> 		 &config_noc SLAVE_VENUS_CFG 0>,
> 		<&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI_CH0 0>;
> 		interconnect-names = "cpu-cfg", "video-mem";
> 
> In the second case we're connecting an MMSS port to a DRAM port i.e. two 
> completely separate producers/consumers and we have specific ports that 
> RPM/RPMh is involved in managing.
> 
> Which is not the case for CamNoc - here really we have some shared 
> clocks which we need to calculate across components within the Camera 
> power-island.
> 
> In downstream the CPAs code does that.
> 
> - icc-clk would I think over-provision clocks
> - CCF would as you've observed under-provision
> 
> - But a CPA's analog in upstream which components set/consume ?
> 
> That would work.
> 
> After all what we are doing here _is_ specific to how camera works. We 
> don't really have many - any ? other examples in Qcom SoCs where we lump 
> a number of different semi-independent components into one area - ICP, 
> CDM, VFE, JPEG and ask them to share aggregated clocks - in a way that 
> is specific to - guessing but - specific to how these components get 
> modeled in silicon test benches.
> 
> My vote is to replicate CPAs in upstream with a CPA's icc provider driver.
> 
> The bandwidth calculations are already proven out in downstream and if 
> we get it right - potentially its something downstream could switch to.
> 
> We could even use the interconnect API inside of the CPA's driver but, I 
> think just doing votes via interconnect and icc_set_bw() into icc-clk in 
> the drivers directly won't produce the same bandwidth calculations we 
> have in downstream - which you may loathe downstream code but the clock 
> calculations we'd assume are ~ a pretty good starting point.
> 
> So; make the CPAs driver an icc provider.
> 
> cpas_icc_set() could/should absorb the downstream cam_cpas_hw.c 
> heuristic for calculating the aggregate clocks.
> 
> Its not represented in generic icc-clk right now and as we add in more 
> clocks/SoCs this disparity will grow.

Just to add, there is a CAMNOC interconnect within the camera subsystem
that handles arbitration between the online and offline engines and routes
the data to MMNOC.

It also provides QoS settings, which are currently configured by the VFE driver
as part of set_qos(). Therefore, I agree with Bryan that, if implemented properly,
the downstream driver could switch to this approach in the future.

This raises the question: should we update CAMSS to use the CAMNOC provider and stop
voting directly on MMNOC? CAMNOC could then vote on MNOC based on the aggregated bandwidth
requests from the individual engines.

Regards,
~Gjorgji

> 
> ---
> bod

