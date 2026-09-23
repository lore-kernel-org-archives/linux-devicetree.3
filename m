Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708435349D2
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:45:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790171150; cv=none; b=s80ClOFoxZfc6vk+vC/j7r3mjpVE9wjp5y5Q/XM5Kh8tk/BFixaixCphY5r/YpwiUzryXA3cqqS+5BqCLnfO/ycaJdkJg6E3r3yVtCSkkQLpSpozVnagfBwXFptzbLzT69GF9xNIhMa1WMep105Zzdp7ETbJduSdze45qlFeEJI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790171150; c=relaxed/simple;
	bh=hAUIAJP2KyIPOrXkm/QtyPmhhjrZyPRauTKH3tyreRE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=BkMzRWsUr5TLJxAmM4kapmPLEf7WuNi/usuGmaSSe3HpVKlzlRoN35f1P59El/8K3NYmeF21nLDjJWE8+GiuR2B4BLtPJlSlasTrY2gule7gwgwiVYE3dV3vciDRjhyWpF+11LTjI7fPP1du7qByAbS/fd7WEkSoI9hFVYMgRfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NHhZfGyt; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f+6D2VkL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NHhZfGyt";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f+6D2VkL"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68NDM6QA3842962
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bvAW3yceqnT6AttFLk4NW8DsgIwVtqPiNNE7x4zTQZg=; b=NHhZfGytzmWFyCsj
	Zbq1+A+FQqTZC64KnzfYTjTVPG4qQ2PppdfaDev7x8JA0PLgl8xEusRGtaUk2Jnu
	dktSsj6AkBdohfO4tO1sewfq6TnnSSJAfWsSJiulrAuLH1YzPMPiVH1eN1YzL+gr
	rXl5tjJO3b9ESRI7PcAkNumaqBIipyJqWDIi7+ikcMskQZRd0A3wRk2DfxasF1it
	2mcq9TNtRWWuNicMFsLObGoyuSiP7WGMx9NrG7MnL3ooMu+9W0VVVhVHfTo5swQf
	RGt6T1OymuOg3EfZA02+riv6lxDfUWyRTWk+mzOgJ+2ZyLA7Gl/eBGkdBvnXp9gg
	Mxdl+Q==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gvfkbg347-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 13:45:47 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7a57ef025a3so61522137.2
        for <devicetree@vger.kernel.org>; Wed, 23 Sep 2026 06:45:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790171147; x=1790775947; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvAW3yceqnT6AttFLk4NW8DsgIwVtqPiNNE7x4zTQZg=;
        b=f+6D2VkL/jknXjInW6WrpzfdBaBovpXfNFUQXbMlJWkhAi3tEEnadw+Uo6PZwLeEux
         Ic7a76SpTnD/qQ+gkheRvYfEsuhy731zBL5baFjGzqrw/OhFN2i2CvEBtwZQKP7H0TFw
         3H+xRsjXr1AAIOmTU7xG1JVuehZXfWIEmHG1R5rJOQM3ctVFurJT0NoY/8NPKYvVJCd6
         S9EQHxakCvgZGiWVLZi3670LNRTS/1h0VloKPq4urOnC4ZfViSr2MhNLc9thR+G9n0S5
         j8bMbMxoPDJkvPM0O2CFfOaPMezsXFKNo7/RNP8ZWzzvOB7yzwjrz4tk+tifU56peaB8
         0Acw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790171147; x=1790775947;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bvAW3yceqnT6AttFLk4NW8DsgIwVtqPiNNE7x4zTQZg=;
        b=ecMPp0gRWD+PvSMK8Rc+K8iNUCWnMow4ArOeXbAae2hNAKTWULM4JDdj4+1BfAKoiD
         B/JbjfSX1KGojZtlbz3TV2plWVsN17bO62mnpcbpLOhYq8llje6YZ51EYvYkRkUXD0QC
         w4jvoDA4f4ezCwsRlaIFLO0PziDl71t9hJtXhz8cTVjPIEUgPbiAXNfeaWjvBObEv9dU
         t3BcKcyQfrQrvVIU5bykvWnHl0UJjKEh6phnBbY9HDrH3LA7lV4inAAFRgut6ky1LmPJ
         xMCQfLpkAjEwZqPWKZMYka8DF8rXnPMslg9o0WSN9VRTVVkNTISWhhGEHNsPHQX0Q587
         yqdg==
X-Forwarded-Encrypted: i=1; AKwUvBz2TR4QlyV8LhGGZ3pI5ErnRiNWoNyVrWCTt67T/VmX2R775PtT/c7poW+VNYK1a/SCsDPPvGozdVb8@vger.kernel.org
X-Gm-Message-State: AFuF++njGh1RcI2pRd6kb21LVwrNVH8a3oeZjA2Jd1o9XBJJMaPfjD/7
	fO73HzbrJnvqGV/FXBUvPM8oIW/+JJzxKeWNbEsup2mQGQJyG8s8fWCsdq6OJaZnSb/HcQAv4D+
	jsyJRDDV3tWKF8KwwnQRrFBup8b3pPJBYPnZDoLsKAW/1lNOYeWqzKgF/C3XgEZ6m
X-Gm-Gg: AYBFou1e+M93rVKdueY3Yxlpk+aLhgjpFqzPerr7Ie0fCbiUQ3lV4uNOF3WDY0dMfde
	OXunXQBIGNrRkpEi9nQPDqQLYgsOnxl2P/71xf0dF+ebas6GPFFZP1IefTsi75cb9TRnCaPZrz7
	5mUmyAR3CwPR86YeTcPqHqlARXP54wLUU/V/GKGXnHaQkE1ApP1wcUucYniypW9O6a0DjU7BHyl
	zqq/19x1Eq/Pz3qzOhE+TDTP/u5p13qru1Ul/3lmdCVlyjy3u+4Y1sDQDpfASKmS+xOdMFCtQL2
	dke08eszqbMsgd5/YC8xD/BkPb9AHPPOPj/aWrAYcWkvOf0qNwZScRuckHP1uDuko8eEY6nkxaV
	q7rcwOPyE7jRhFU8s3XcM7A==
X-Received: by 2002:a05:6102:5121:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7ac1c454b57mr2548250137.2.1790171146472;
        Wed, 23 Sep 2026 06:45:46 -0700 (PDT)
X-Received: by 2002:a05:6102:5121:b0:7a7:326b:688d with SMTP id ada2fe7eead31-7ac1c454b57mr2548220137.2.1790171145961;
        Wed, 23 Sep 2026 06:45:45 -0700 (PDT)
Received: from [192.168.202.12] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6aab37478c9sm1722267a12.0.2026.09.23.06.45.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 06:45:44 -0700 (PDT)
Message-ID: <32bceb7e-d06b-4537-9d34-91bfe27f4ff7@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 15:45:40 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 06/16] usb: hub: Associate port@ fwnode with USB port
 device
To: wens@kernel.org
Cc: Chen-Yu Tsai <wenst@chromium.org>, Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Brugger
 <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-mediatek@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alan Stern <stern@rowland.harvard.edu>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
References: <20260721065413.2306137-1-wenst@chromium.org>
 <20260721065413.2306137-7-wenst@chromium.org>
 <c6526ba0-be08-46c6-a501-1b161939657c@oss.qualcomm.com>
 <CAGb2v66c8L20yNNmvj6TaQbS7LnqAyuv0tMQfj+0PSjMUcSByA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <CAGb2v66c8L20yNNmvj6TaQbS7LnqAyuv0tMQfj+0PSjMUcSByA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfXy61b8ZdgHAxS
 dVdFiSNXYmRMxfPCXgVWAIdXUK6wA6gYkfMZb4BZVcfT+86oE5Pwji1Qad+uvFefRlY41Mu+19m
 3us1V4OlVkRZkFX0nqcVZlyeU9l5NHQ=
X-Proofpoint-GUID: uVtS0HidMXwevE-rSFB2UDiiF-gG63uo
X-Authority-Analysis: v=2.4 cv=RYMFmFtv c=1 sm=1 tr=0 ts=6ab3d80b cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=M7ONEjnSaIfHBpTaVFwA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDA1NCBTYWx0ZWRfX7G7WgOQoDnVj
 IrwEZdRlfana/lBr2mTrm6kzS3wCQIKpcnl351Ib0wZFwkMlYY9S0uYdNlEJQ61gpOZWvTvt3mP
 lGliA3sFo9UhFEAEPo69LOW6bx/xRRr0aLRAmnWILcskbG3y27JHrTkZCEIC7247LrY+X65Er9F
 LyfPlSdBBjmwe3AIaLVxjJfyWyVD8oVtLKupNGYAG0O3zvgc1wMjPkr7duZjbVQ0hbeWkdB4can
 ph8Snp9MoqQpGMQIKpd5LibcBm1jOKuxbnvlv7Ewen8BzCkgHslurilG23CFjLJIszs021NOzF8
 DDh99khnRkpNA35/sj6FSfxInSY51wylMBJWmmUKKBFOL/0ijR0sNljpNYp0h9qXd4ZF381abis
 4Xt9vSOka8q1mEppHA5B64nQIwLAWU9+VrLxLqNPdq9M7x1SapZzmq21h8Shqlcp5J96kfAxExt
 gvs7niqFt5s1rinDRPg==
X-Proofpoint-ORIG-GUID: uVtS0HidMXwevE-rSFB2UDiiF-gG63uo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-23_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 suspectscore=0 clxscore=1015 priorityscore=1501 phishscore=0
 adultscore=0 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230054

On 9/4/26 12:30 PM, Chen-Yu Tsai wrote:
> (dug this out of my kernel.org email)
> 
> On Fri, Jul 31, 2026 at 10:44 PM Konrad Dybcio
> <konrad.dybcio@oss.qualcomm.com> wrote:
>>
>> On 7/21/26 8:54 AM, Chen-Yu Tsai wrote:
>>> When a USB hub port is connected to a connector in a firmware node
>>> graph, the port itself has a node in the graph.

[...]

>> But something I faced when I was poking at USB4 was that dt-bindings
>> currently assume every controller is effectively single-port and the
>> of_graph ports under it represent HS/SS lanes, i.e. the entire
>> "ports" subnode represents a single USB port
> 
> Which controller is this? AFAIK for xHCI hosts there currently is no
> "ports" node specified in the common usb-hcd.yaml binding. I plan to
> add this separately, as it can already be used for USB A connectors.

DWC3, the qcom flavor specifically (qcom,snps-dwc3)

> The kernel maps every downstream port of the root hub to a separate
> node. On the XHCI it is more complicated because it has two root hubs,
> one for HS and one for SS. I'm not familiar with the hardware specifics
> but they seem to map into one common namespace, so you probably get
> ports 1~8 for HS and then 9~12 for SS. Note the number of ports is
> different. This is just an example from my x86 workstation. And on
> x86 each port is mapped to a different ACPI node.
> 
>> I think the solution here would be to do ports {} under the controller
>> and have every one of them have 2 endpoints (for HS and SS
>> respectively) - then, each DT-port would correspond to a USB port
>> (sorta like in the hub case, minus the hubs are split for HS/SS so
>> they have just a single endpoint under each port)
> 
> But the hardware descriptors actually give two ports, one for HS and one
> for SS. And in the case of dwc3, I suspect that they always come with
> one downstream HS port and (optionally) one downstream SS port. So the
> binding is actually correct, except for the numbering.

Ohh yeah I overlooked the HS/SS port split.. I think you're right!

> I'm looking into the dwc3 case. Changing the numbering might actually
> not break anything. Linux seems to just need one *a* graph connection,
> but doesn't care about the number. I looked through some other projects:
> 
> - FreeBSD doesn't use the OF graph for anything
> - U-boot doesn't use the OF graph for USB
> - OpenBSD doesn't support dwc3, only the XHCI in dwc3, and doesn't use the
>   OF graph for USB
> - coreboot doesn't use the OF graph for anything
> - Zephyr doesn't support dwc3
> - TF-A doesn't use the OF graph for anything
> - EDK2 doesn't support dwc3 and doesn't support OF graph
> - OP-TEE doesn't support dwc3 and doesn't support OF graph
> 
>> But that comes with a big breakage, as always..
> 
> As I mentioned, it probably isn't as large of a breakage.

That's very welcome for a change! Thanks for checking all of them.

Konrad
