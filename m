Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792489523;
	b=L0oDcx9Det2xX6EaeQgy/LV8+SHtDBWayMzdWRLmPpJjUgZ6nEaYyBHreYwvZDPS7LsC
	 J6Zg5wotoOi4ijfH4uKOxn80iOvPTcFq3pd6jpb2R5DxZKuom3pKo5Ixv1BAMpPbbOYyB
	 m80AFfVKlZ1MTRY7qe7Fu/GNZaFYTUSadbd1f4UapCe+OqBPPligB616mQ5+tJjtaJDIp
	 HRPfXzN0NLfunJp/4EbXCoXTW0X/qZEnwmDYKHmq8393bwh0ueIclqn3Es+Yiy1k1eTQe
	 I/s9FaY22KcGWd0ixYcxgLy0ZymV++etdhONgw/WvoRH4N82ZYaVcS3VPm/miTAE7Vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792489523;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NC1hiC1DqKSX7UHtU2uk6sPHM2rRGUITByEu42a5Geo=;
	b=P9pPcIjihs7UdIORuAXWmVkzYuUK70fY8+o5IuFJ/dT36omg9MTHoZFxpa8J9+sYHlnp
	 0PH4GOKOCZJ+JxCBNsNd4uLzLibBIU8XznddFbNVtICl4/zTSIFRcI9RBLD9s27GUiEBT
	 zwSW/Kdt4mQtNNL5o1jc1AhClWj/4UjgkusgYlujcmp0FTaxgV7iHd33b7cxhcBsUZyfh
	 AC9P8yujv1x9/9pwbggnctSQpSMaUiHZ60UD9DUU6mjlkcboAOdKt/2Su1s7IdpBMfJ57
	 2NSh/QbpfnIrVrDuQvyfK13WGsd4x0TSnVfPnQEn9UPXtr699JvH8gFqrSlK/c152Ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dUk1ohYl;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YQeE1KvB;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730DD606A31F
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:45:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 730DD606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dUk1ohYl;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YQeE1KvB
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69K8QDdN620613
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:45:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=NC1hiC1DqKSX7UHtU2uk6sPH
	M2rRGUITByEu42a5Geo=; b=dUk1ohYlAnMiWz4Far3u5Icgm8K0xvjB5E7uZylM
	bUCZ6zptepiTPlcVzLAls8BmzTwNRfwQywBUtjUCcZXKtzK9/PNLzxtJ2tFSzsqK
	680r718XjnXTfs+1zjqkJWBVN6+j1LTIrxnCHg0b//ImLu9AVZtgIbMhEZKymyKf
	ZQ4cz47cOofM8Aw8n951bwK1tCZnjVwGkuf6ZxpxAJb85ug9pVQlpReEA851Qz7q
	7I8ify8DIpnZ36DAUF8X+4Gny2JgXcrkZ1Z9i9YEOiXC+CRia/QGAsLSCBL+OXim
	qFP2z9/SsBvEsBJ0SnIt/oiXD9vbufnKsFWTl0WH00Nowg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdw5nsugp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 09:45:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-53639e47be2so61930191cf.3
        for <devicetree@vger.kernel.org>; Tue, 20 Oct 2026 02:45:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792489521; x=1793094321; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=NC1hiC1DqKSX7UHtU2uk6sPHM2rRGUITByEu42a5Geo=;
        b=YQeE1KvBeje544RoY3ZWRFZsu+SF6JdANvPka0e7QDhmuuqR6jL9Z51IRlII9YGb16
         2nCtO/lkME4HyKshWJrrk7Wm4X+fmCu34G3pzZZ09AvkRF0ZnXSr0pk77yL/areSyq/T
         SYkPZ8VfJnOJSzhimnBCapZwTC20jf6PqYkyPUz6fZOAgTVPU0KOFy93ql9FlZ6q0Ro+
         3yAUtOjK8PaXte0JNi2S2O6CGA1ZmixrovQiPK9JdvXsKUFvXoUqnPBEnjMZqdaQRWMT
         eCsP85SaTO6aIZfv8DEsh59UOujxjPXP+C8ElzcQJq6xHgnOeHFdECbJm3WO4TvpW86U
         RiqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792489521; x=1793094321;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NC1hiC1DqKSX7UHtU2uk6sPHM2rRGUITByEu42a5Geo=;
        b=HsSIbJya9jvA0hWEM5ameQRpXrX0iOp536mECkthynsLCkcTrhChIPw4e9UHRFcm+s
         UB2X/kwcJjSsuk8nC+kj71Lj0OoX60hCvDg9m2Q9ezIO+BmW1zGlo3+UvQGJa5emF08i
         1CYl+zJSmAgIb+C20T7m4omskZJnh7BKvu87Ti5uzryy0NPfYC5Ovw+VfR6RqJychZ5E
         xxBzfO5Yd0Y9RqIpuOGKMHIIfmsmFVWQBgMgwwGSU7ERZ/RulbmSYaJ2qEnrmstqDLni
         Ru9PdgVxfXa8fJJHDWtUc5624cUseNEClpQhCSa6M1nFUklAepHuHOcYyUEyP9enI8YG
         22Xw==
X-Forwarded-Encrypted: i=1; AKwUvBxOOiVIyprjzNjNwZfyl0gJIERWpe6yn1zJef0vMxr3xre+HufFpt5F8NsF2IW4qwAJC6aQgEDO41xt@vger.kernel.org
X-Gm-Message-State: AFq9FYKaSqbg0i6gogeVjzSKt5dOWFRbZK2iVINzAI+QesfcfzqZijPE
	zBwp+m1p2Sd6oJoeGr6NBaqo+fU4ho+xwsMQZe0wd0P5JcBzWHmgKYHWxHo5rhhOTzEWT5iaL+e
	WaV/TDdlujaI95vKVMGEjhI47ozTSKRwNq+jOD2e4g1vo3EtKrh2S4iTE/w4lHUBO
X-Gm-Gg: AYBFou0l+AzhGlBtZPXaZedp5TVnbtoqUA47S8AVOjCKAD9yY0k5zPuvLLNOwYFMhZC
	THQOOAIPyxnWR3SVR1uvgiXop7qfUtmwdLriyPjCqwBEm6LxTUzwC6RIUOJVxmu266wlT/k9TVx
	17pH3vzO3DeKpBK+jiEoDjRt+AZkIeYtEUihv0qNPXrIaZ2X0KWC9Jw4oDHTaYK2hlRy4Jqwi06
	2QgTlp9WiCvwr7EH7fySIKmAlTusgJHG8m5rPUHXhRGChlbEPQUyZ93XPPzRJQQjhbRB1t2BC0C
	2MU/aJxvX+JjChXQ4s1rvJ25J/nl9LnrDbQ2LmYpne2ByZ7VSpvkSCtyC60fDyepV7Y34TIiK+V
	kfeaqUt+INgPyE75nm3VfRqIo7F/dt3oyTmry0GPDTOpoapfT0I4fogSkMVQq5B1kAC5AFFKhkF
	a+hftcublqioIN
X-Received: by 2002:a05:620a:7085:b0:93f:21de:f3da with SMTP id af79cd13be357-93f29cc9ad3mr1601788285a.15.1792489521590;
        Tue, 20 Oct 2026 02:45:21 -0700 (PDT)
X-Received: by 2002:a05:620a:7085:b0:93f:21de:f3da with SMTP id af79cd13be357-93f29cc9ad3mr1601784185a.15.1792489521107;
        Tue, 20 Oct 2026 02:45:21 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5be4a3fcf07sm2478354e87.3.2026.10.20.02.45.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 02:45:19 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:45:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Georgi Djakov <djakov@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        Jonathan Marek <jonathan@marek.ca>, Bryan O'Donoghue <bod@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] arm64: dts: qcom: sm8250: add camcc interconnect
 cells
Message-ID: <x5x4av76vm3swozvwe46uq5vz2ys7bvo4bducpp7flnmhykg65@pvr3znxyktje>
References: <20261016170701.1504338-1-atanas.filipov@oss.qualcomm.com>
 <20261016170701.1504338-4-atanas.filipov@oss.qualcomm.com>
 <usade5zkrncpry4ufbdtaahoa2zyd5hx7tjgfvzfte2aqbkgs7@t3mej4maj6za>
 <3e5b7781-20ef-4e84-bb62-29a081c26d8f@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e5b7781-20ef-4e84-bb62-29a081c26d8f@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfX+PVYQcWDdGao
 UrK4dhy3MtjVdCp6OBNsGqGKAZeOu9IenU89/BhM8K7CA7gmEf9A08HtRybTEqco8W6xXAWKBjN
 /d8yG2UrKfsP9vBXTZ/sKxKtLxNcxk0=
X-Proofpoint-GUID: QI6zWmJ5XxK9v8DZ5qL_pqn8mHGOhzea
X-Proofpoint-ORIG-GUID: QI6zWmJ5XxK9v8DZ5qL_pqn8mHGOhzea
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDAzOCBTYWx0ZWRfX6JhKuj4woevN
 wxK2fiF/+tnEiwd4vr9/Bv9IPT06G8ZoOUU04w6/XxMibxGPJsUR5k+lVXOLxWrE/DFtnXbEsCt
 2YUdKuNdyS1qVcGVQb7hYxHCoBNmjKYABq2YZNhLGreybGIH8loI/kk9wTzHs3ffHEnlZs3BHXi
 8rRaO52y4iaVV674kq2tPMnG7WNrc5shDkMgUOWl8Rieltrp8zdvtJq3j+7oycH9MhpJNbR65iG
 Ggdyamhi/xyKrhKJWKtCKI4SVo0IBChxxRxegFGh4IMvdX2ascPFCPo9M8lwajq9VYBiAZz6nSV
 yNwHo/z1lrNSpV6P/JM25Lk6M8fN/7MBYkbzKbrtg51YLoWagyZZd99lx/icZXQKOiI8yrzdmFB
 khTQ4ANlHCFl0QmsieVtXjtoNoeo6sHF0sJiz7H3QpOSwWelhLpBuY3HFe05Kdz1b3wHmROGySY
 8kwqonGWptXUHlRJFpQ==
X-Authority-Analysis: v=2.4 cv=TcsDJhQh c=1 sm=1 tr=0 ts=6ad73832 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=1SZ4gMyvtsQaTvh4xNwA:9
 a=CjuIK1q_8ugA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200038

On Tue, Oct 20, 2026 at 11:26:42AM +0300, Atanas Filipov wrote:
> On 10/19/2026 5:50 PM, Dmitry Baryshkov wrote:
> > On Fri, Oct 16, 2026 at 08:07:01PM +0300, Atanas Filipov wrote:
> > > Add #interconnect-cells to the camera clock controller so camera
> > > consumers can request camera NoC AXI bandwidth through the
> > > interconnect framework.
> > 
> > I guess currently we have only one consumer, camss. Could you please
> > include patches converting it to the bus voting? Be sure to retain
> > compatibility with older DTs, which don't have ICC provided by the camcc
> > node.
> > 
> 
> Before converting CAMSS I would like to agree on the approach, since it
> cannot simply follow JPEG. In either case the camcc path would be
> optional, so older DTs keep working as before.

How does the current camss vote on the clock?  JPEG is not (yet) merged,
so we can't reference it here. The order in which the patches can land
would be: icc-clk, camss using the (optional) interconnect, JPEG on top.

Please note Krzysztof's comments.

> OPP is per device, and CAMSS is a single device containing several VFEs,
> each with its own core clock and its own load. If CAMSS used
> dev_pm_opp_set_opp() on its device like JPEG does, every VFE would overwrite
> the clock and bandwidth votes of the others, which is the same
> last-writer-wins problem in a different place.

For this series just convert the existing approach as is. We have two
distinct questions here:
 - Letting camss and JPEG (and others) to vote independently on the
   clock
 - Letting camss correctly handle per-VFE votes

This series must address the first question only.

> I see two ways to keep the VFEs independent:
> 
> 1. One OPP table in the CAMSS node, used only as a lookup. Each VFE
>    finds the OPP for its own required rate, sets its own clock and
>    votes the bandwidth from that OPP on its own ICC path. The driver
>    requests a separate path per VFE from the same "interconnects"
>    entry, so DT describes the hardware connection once and the
>    interconnect core aggregates the VFE requests with the other
>    consumers. The rail level is not applied by the OPP core in this
>    case, so CAMSS keeps handling it as today.
> 
> 2. An OPP table per VFE, attached to the per-VFE power domain device
>    that CAMSS already creates, so each VFE calls dev_pm_opp_set_opp()
>    on its own device. This applies the rail level as well, but the
>    virtual device shares the CAMSS of_node, so it would pick up all
>    CAMSS interconnect paths and need indexed OPP tables in DT, which I
>    have not seen used for such devices.
> 
> Which one would you prefer, or do you see a better way?

3. Add minimal VFE nodes and let camss use those. Converge towards the
split VFE (IFE) device tree.

-- 
With best wishes
Dmitry
