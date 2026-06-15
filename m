Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE9D3F8EBE
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781534684; cv=none; b=ZfxVD/3irSoJanfbdyWG1CkbCZ6pxW1mxE2FW9bL7swUq9/PWuHerzdhFttJaH0T79BQZPgCWySN8nZDv4R5Zr5KBNAU0EQhJN8q8bSwly8O+w/IgAMKtLMp8SxD2a1pzwX/bCJCvdSgnGoLguTyvKZjzdBV3eaFN4Tl05pg9bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781534684; c=relaxed/simple;
	bh=wVczAE4BvCr1c1Rw732n0oj3annxMP38/RrvE0NcFkU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=tZl9oAVMba9DQJqx/LIHmeRBHn1Rr4q1W9lJtq5kiLCdvLWjCqRQCJQ8/MdiTz8ph34fWPnO5EzjUwN2ZxEJ9C738Z70/UxfN+F0QOCbj4917S27rZ3/UU4lKpLzhSC69SKhpHNdM+ruDSyg0Mj4zdRoH68kntPe0KlAKOvxD3Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aROvyvhH; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DGyf2VVi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aROvyvhH";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DGyf2VVi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FEYDjb257134
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:44:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	xJJWeCn0xRFEnOpJ5bzTkC3VlDqzl5JZmrfiMpAiPkc=; b=aROvyvhH+/QCNVQG
	moNQovKnv5N6axedtHmISUAwJ6CZxHo6rI/6f9KxQnc+Y/cI4KKbe6YPsM7D89oU
	FWK6PkDu8jNt0/xguAZbsYDtOgtwOB2PXAXKFE0l27sDjdkwagHUN7PegiiPVHq7
	in3QXDIVemj2+7SpJHlIsDFaEYdNXbfXooCzr/MysCMoN8KL6FS2MUzkdB5Dpnnd
	Q6UGf3xEZYPFmioh/rMqu1sBA0ycwVqBOuMpF9D5VRROBZxkCcXySIZkT9JbnvBr
	v9OKjWdhnXm2EL7w6T6d6wgxgHBSLE6nilMGnCn5SaTbA0Cn4gzGbtcah7Z7Tmwd
	SXmZWA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4eter01739-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 14:44:41 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-5175bf22b2bso4281921cf.2
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 07:44:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781534681; x=1782139481; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xJJWeCn0xRFEnOpJ5bzTkC3VlDqzl5JZmrfiMpAiPkc=;
        b=DGyf2VViXRaHwm2o8k1Dzx16LBeK8KzZ6wCUFxFoIyTDpXCE2HhkwFVuk/7LPm8btR
         YrMxrpajA6kjvjEWVUcH+NeMwVWxWSIfrf4kZKc/3JE68ltDhX5OArAY5jp8xHM7c7Nv
         TQy4R7/ZQvwqh0Bm0WOjYtqipMLTMW08pkJ6aGGVUX9Pg0She4J8of4tnlr2m4g42B3p
         r+WyF2qdvWsAofMa4cH5alYGBNMmri96NeOrJztRS+NaAH/P67OpNyYlcv3EWPuQYmeQ
         tcDhbQAKuK6Kxxq2L+rofLxzBVAm6DTnGmjIUjmShCYbi1gNzpkeVRch6QCQDqBe5hXf
         cByA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781534681; x=1782139481;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xJJWeCn0xRFEnOpJ5bzTkC3VlDqzl5JZmrfiMpAiPkc=;
        b=YjSzHKKSPaM5UrfZetNpTuvOaZP190ssISqxErfs0A98gOnkyyq/0fOG7V0ahsmstG
         4zDHR3PARn/kmES1C/Dhev2ATignIFUT4OjuTPIBL0t4cUo/3iQDxgK0NK18E79CpEdR
         gzTIO/0QADERN9ugr8bHYLQXgYsySqIu3HLSbnr4qATWEcXq8ydD89gbCNRnsNgEclnL
         k7OXj04kfFn9r42a4AYOQgsqM7DKhrWmyFUz1TO6nN1oIiT+vlx35noeGRLcLP7gaTAa
         RvlOjway2zK/sdwsajMoTG/wOUmjiBpbyRXONrjimsXulResMpxBumpEXVzkDrzhdbvE
         qB4A==
X-Forwarded-Encrypted: i=1; AFNElJ9JHGiF7r/TsZ3ApumaYhK3oKNxhX24CqVOdgGf+GXx1l8qX8Jix/Eoomp/vO8hHQviHtQlac0trdSC@vger.kernel.org
X-Gm-Message-State: AOJu0YzjMZ7ga40r1SrNMSbgIJYA8V2bgv3P2A5vR2H+rkvmewzFoQv1
	RAZlj9ZK9cSdzOQcIuDcXMvnVd15telkvyETQ+Ih67K+K70ev8K2gB8H4pQcZdRDZxo0vM0K5S6
	EMQD8rigM/jQkvkPzbQ+qqHf5rKqaHRHWq041/PgBVJKnMbnTZjfbBNuV7qwzKR4G
X-Gm-Gg: Acq92OGYMJK99IshNglil4OJzHiwNsIbKUfnxKmy3Hf8W+68SUEvV8m9j7sO5DTSmer
	Eh85M0OGbFZ+WA5+IvIQaDJHEhPaRG9BG0S0Yd2iqkYtcO+GgaBk25CD+6iYqSYjGPzNcAgh+3b
	rw946eI9jNqIXtcTiHZVxOS6qr1D/R9+qqLStCHSB44fG1Ik2XmcEb0tvUyAb2uEZ/egKrvUyhH
	QRmU39uj+TORT7FrTboyZ70eeirgFizGykV+r+0fOrxMk9fj/B4qBJus80HinBCwYQeszZFnc3C
	2miDNLECl+FjGKI+iTtkiCy68AvAXJBs5G+mRlbaZRhgw/9DXlftrJgIq0DqSkp3MDAYhzdlerQ
	8QC0VuajGqw5snct7TEdq9yqo2BgDAIMK83lk8jDHNi0Gvw==
X-Received: by 2002:ac8:5e06:0:b0:50d:a92e:fead with SMTP id d75a77b69052e-517fe50c57dmr138011361cf.3.1781534680850;
        Mon, 15 Jun 2026 07:44:40 -0700 (PDT)
X-Received: by 2002:ac8:5e06:0:b0:50d:a92e:fead with SMTP id d75a77b69052e-517fe50c57dmr138010891cf.3.1781534680347;
        Mon, 15 Jun 2026 07:44:40 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb910f89bsm500939966b.61.2026.06.15.07.44.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 07:44:39 -0700 (PDT)
Message-ID: <294012ad-1030-4c5f-8910-30ae4962b65a@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 16:44:36 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/12] clk: qcom: gcc-mdm9607: Drop incorrect
 apss_tcu_clk_src
To: Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd
 <sboyd@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Taniya Das <taniya.das@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260609-qcom-clk-mdm9607-fixes-v1-0-5e9717faf842@linaro.org>
 <20260609-qcom-clk-mdm9607-fixes-v1-7-5e9717faf842@linaro.org>
 <f55526ad-ecd2-47b2-8b8f-5aec429bc1c0@oss.qualcomm.com>
 <ailwFPgY13_7dZ-C@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <ailwFPgY13_7dZ-C@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kFsA3InJDvKWgOJmzfPXP1sr78Qdb_95
X-Proofpoint-GUID: kFsA3InJDvKWgOJmzfPXP1sr78Qdb_95
X-Authority-Analysis: v=2.4 cv=UPzt2ify c=1 sm=1 tr=0 ts=6a300fd9 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=j8Cu_9a8AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ck7eFbc12gNnvPpTPzYA:9
 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22 a=A2jcf3dkIZPIRbEE90CI:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDE1NSBTYWx0ZWRfX3lxGMHhLpjp2
 l5EsfrSuOIeq9+E5rwVDmvjPXm6wCVkE3kDaXWB3uDw+j8G4Zv50yDnY7nxzjYEXVhgRx9mfOAp
 KyAHJ0aMkrDaYiHyFYbMcpA7d9MXDuL7ClZ7mHut2yLAeYTPGhGB8yZa0tH5AEx+awy35p7PMSG
 Stgdk3LZLY1arJV/ANY83l2kJNl860zR6USBAokZmCFvMSMM8bsl04Jb8eyzS3LAuAfvdvGCYNV
 77Yn8MrP+nZbiDFtuCofu1E5haQ4ZpW6fqzM91v7icSQvJqjxwOPdreV576c0dNg6DLAWMoJJ1A
 G7x/EAqlxJdm90HipsIZKVyTEA9VJLxRJM6XqTUGo2/3gKmVrjITpN9GfvxiZ38QOsr/DPMqeLk
 ILcU4U49/nlJ2M63jV3a+0jiv3Nq55vXEjpqElI1SLyOJQuthWD9YFL5a58tjcWx+Q4SxWaImYX
 q27FSXbt+mG/CDQJ4zA==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDE1NSBTYWx0ZWRfX+OjF/FecmMdQ
 5y4VOPJ015R62zlvydbJ5kzHtTPHgk7fHLufHNVvQo0TD79KVZVYpGkGYsiYFZXeuehQFudwzLh
 wQ7wtR567IzMPuVi+c2hDTVr4x4B5Hc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150155

On 6/10/26 4:09 PM, Stephan Gerhold wrote:
> On Wed, Jun 10, 2026 at 03:50:11PM +0200, Konrad Dybcio wrote:
>> On 6/9/26 4:14 PM, Stephan Gerhold wrote:
>>> From: Stephan Gerhold <stephan@gerhold.net>
>>>
>>> This clock does not seem to exist on MDM9607. Reading/writing the registers
>>> always results in 0 or crashes. The math in the frequency table is also
>>> broken. GPLL2 on MDM9607 runs at 480 MHz, so:
>>>
>>>  - F(155000000, P_GPLL2, 6, 0, 0), // 480 MHz/6 = 80 MHz, not 155 MHz
>>>  - F(310000000, P_GPLL2, 3, 0, 0), // 480 MHz/3 = 160 MHz, not 310 MHz
>>>
>>> Presumably, this definition was mistakenly copied as-is from gcc-msm8916
>>> (which uses 930 MHz for GPLL2). There are no branch consumers of this root
>>> clock inside gcc-mdm9607 (notably, gcc_apss_tcu_clk has bimc_ddr_clk_src as
>>> parent instead of this clock), so we can just drop it.
>>>
>>> Cc: stable@vger.kernel.org
>>> Fixes: 48b7253264ea ("clk: qcom: Add MDM9607 GCC driver")
>>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>>> ---
>>
>> It does, CMD_RCGR @ 0x37000
>>
>> Interestingly, there's also an SMMU instance.. although downstream doesn't
>> seem bothered with it
>>
> 
> Thanks for checking, but that still doesn't give us enough to work with
> it. In particular:
> 
>  - What are the frequency tables? Which parents exist with which IDs?
>  - What is the hid_width?
>  - Where do we hook it up to some children?
> 
> The way it is right now it's definitely wrong. I don't think we'll need
> it so removing it like this patch is probably the easiest thing to do...
> 
> Thanks,
> Stephan
> 
> PS: This platform has the weird TZ-managed SMMU (like MSM8916), so there
> isn't much you can do with it from Linux. Unless you are running TF-A,
> then you can describe it as "arm,mmu-500" and use it for everything
> pretty much exactly like you would normally expect. But you still don't
> need to do anything with this clock.

Alright then, let's just get rid of it

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
