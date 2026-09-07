Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B000F3AA504
	for <devicetree@vger.kernel.org>; Mon,  7 Sep 2026 04:03:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788753794; cv=none; b=eb6u9GfRtXNhBcJV28mWUyZyJa+UjvJ541P+Ap9uJyGc4eNYofQ8ZfqLti277o5/ipPF38kP001cCMyyFe7HdA7xL0OLd0dK4QyeL+VFk+z/JNX5MIGM2oJ7oDauTiZvv0orgpGKUDuxR79ltLHjGM/vcrTkcYYvpxg/UCWa/dc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788753794; c=relaxed/simple;
	bh=nHa62S2Fcop0tZTlAtSH7MplYDBYa+sP0sz9MET4hIQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nc9ptJtBcX94kpYnsEWxw31MOzBoQ+TIyADwdn4+RbKVGX6rdYRL3IqLTvVEpkYL889p+qhW1DTABhaD0hQWstopicEDiBpuyvGj/feM+EPjHHwkJHH1WD5PEIVh97D1ISqYq47WdObDcBvYaZfP2fGQkczpN53aYfB3kfb8NxM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Q5rAc/Kr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=B/p1RFFV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Q5rAc/Kr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="B/p1RFFV"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6873laSY3103229
	for <devicetree@vger.kernel.org>; Mon, 7 Sep 2026 04:03:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nHa62S2Fcop0tZTlAtSH7Mpl
	YDBYa+sP0sz9MET4hIQ=; b=Q5rAc/KrRsZVCUKuHOaqa1dHn41YqhPSjp8LrCX2
	+Rj/jmzD14q7cisqYksr882AOOov2OYEs8ZI64HbHGr3PD7ypqrO8NO1HrIa2FA4
	P26lYKppG2O/a641PTCAvVytMFzSjR0JTo9PJezMko9gyQ2hp5M8MwJE0eUTYEx2
	BNsJyckesb9c9UrtzZOh15Kg1hsKTMjRN/Lqo15G8cKnIv1YJ3f6tUyHloZNb2Zk
	udzwWClUGZ8kRyNavVkikTnr4Ho4slqKfs0BtBu6ALr3KySZdjGQak0nfdbhkrf6
	Jds81yifsmkYL214lgc+pJA2z672ZZW9OCvPY2bPLqIjmw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ggb5vcsgh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 07 Sep 2026 04:03:11 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3965ba1ba3eso3822695a91.2
        for <devicetree@vger.kernel.org>; Sun, 06 Sep 2026 21:03:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788753784; x=1789358584; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nHa62S2Fcop0tZTlAtSH7MplYDBYa+sP0sz9MET4hIQ=;
        b=B/p1RFFVephpB1p6vEil4vfpF0dB8QpA+9s/cPiIMpmDoKe71XmcPGyv9FU/17aekd
         zLZR/lpyGnN6O0qKbveb1kpTNDh0TMahqGHrFduW8WqJiqdxerQP4jxQ60v4YbUp0jpg
         oE/6WrkCA9JWuMuAZ9WwgrnnvrLd120iaZGyzUzNvQ6a508OgOjqa8HwJGxRu59e+2LG
         95bmkLNh2SY+PifBDvfCs6SrdigvDrEWKYaEza8uzAItJ06IuaazIszgpbLSfFCUTEMH
         3sAjlZF+xVFUJv3N51LNyxQClOJ62TavU6EoYqIBd0hz/CK+zrczDctwUFeTYakSeydK
         54sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788753784; x=1789358584;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nHa62S2Fcop0tZTlAtSH7MplYDBYa+sP0sz9MET4hIQ=;
        b=d3VNHxAcNjZGxIzJ4mT1vRlITMmAUsZUkePq8u4RoTRtNcfaOSaR6KnH6XgjrPqJhR
         RGU+17zEPND6coLwdHmvgygBwAYt6eKS/63h7HLeaVc1eRSM0Gx7RtByDOuuBeZg7XNe
         0hdFlG1+qtk+5alO4xV8XFdcXKxvbYqand4c3d0zltyL5rIvW0T6YGUL7p+q7NznLElj
         WlP0RCu2gDOjJBbsBHuPLHs9NenSWB+Udm9oNR8GYKPYVtLhRqvXnk84FW5Jsw3MhCq2
         7twkwqGPLsQje7SsdKBJWF3XBwcuk46bsUdccsgt/kIvperZ+uCTxPPUi8tG/yz8WEX+
         YS5Q==
X-Forwarded-Encrypted: i=1; AKwUvBy8+lKiINMIzR8FIcL4iZ55ix8g0z98orBFUMXbEjS8m67GnOvxnP98GwbXqI/A7P/ANMXXd6V4V021@vger.kernel.org
X-Gm-Message-State: AFuF++msLJIKbP5WoA6R7ouTkGijCpkwnp3G7RvlMOYmhqmc66+lMTDg
	d2EokZtWPwx4yQwrkM4Z3mweHyLIvnQyxi0HLcHU1YIgP5kKI6ExhJH7GstFiTMHbQSVKP8UVJg
	1JwGYndeo1Nwi2j9RrZ75EC3YB6G7jc2N1VXr8dkSldvKn30gqmokklfwRENvC6xB
X-Gm-Gg: AYBFou2+GRlz0WELzW/H1gjRnjKNo1+vLZIPuzd7kQuGJTCiuZU9OZ0y0+weYjI9q0H
	seAvSovK2tLCNAZTUFvlOxvdzcsH8CdBNJghjN/ZLJsF7wQuYC7Y7o2zxpa8eESq+XusCDS2vuw
	zxqvlvLuaxASfd89dvEQwlu1/02ic4VLj3k9Tx3UpV1ZLRsJYvLGu60dOU1sJoqCxwkOyT+mDuw
	Lp/2svEtwOSVPWm2D7+XT8PHl7M3vkVN9I79z8TNfRXDM4+uJ8JmRrW/wYSDNZWwb1qvzRB9LRu
	/Bc31N0sJMKEub2oQgNiUEsdSdXVWvchI9XASzmktEPgcew0BSxcfKxw4tGrsLmqqUFin7d4nsI
	8QMmJ4c575BO4zRTtZzVJD62uCF6vFsdc+eLKbCPC6L4af4Lsn8qrJiucWnuDZqjtOSEKRy83M1
	oSlE0Eh86ZtDxavXW7dffFI9JTvawsrg==
X-Received: by 2002:a17:90a:10c9:b0:39b:34ef:3b2b with SMTP id 98e67ed59e1d1-39b34ef401dmr17670962a91.14.1788753784347;
        Sun, 06 Sep 2026 21:03:04 -0700 (PDT)
X-Received: by 2002:a17:90a:10c9:b0:39b:34ef:3b2b with SMTP id 98e67ed59e1d1-39b34ef401dmr17670914a91.14.1788753783888;
        Sun, 06 Sep 2026 21:03:03 -0700 (PDT)
Received: from hu-varada-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14340a69666sm3798517c88.9.2026.09.06.21.02.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 21:03:03 -0700 (PDT)
Date: Mon, 7 Sep 2026 09:32:55 +0530
From: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>
To: george.moussalem@outlook.com
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 01/10] usb: dwc3: core: Allow glue layer to pass
 reference clock rate
Message-ID: <ap43b3zog8iiBgt9@hu-varada-blr.qualcomm.com>
References: <20260906-ipq-flatten-usb-v2-0-dab83120b10a@outlook.com>
 <20260906-ipq-flatten-usb-v2-1-dab83120b10a@outlook.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260906-ipq-flatten-usb-v2-1-dab83120b10a@outlook.com>
X-Proofpoint-ORIG-GUID: aE27NuDMSR9ZIMBMg89UoyoQGtViRBmq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTA3MDAzOSBTYWx0ZWRfX4EU9j91+hAwN
 VvRpJzeetsLL2cL1ld284t0UqFH2BH3BIXi7s0OfpAsbTtnOBTlzt16QNN2Cle1YIUPRsyT7WXH
 lQ1XW5WtWvMrmJlvPhcMbe6dGKD9omA9od60yrkEt/TLdgpNkmS0pRi0F7ovhOfWmLFSQkx51YH
 pGd0XkMsfY9+XRIOo3Zyn8HNW66EzqpeGHKp5i8cNezYVfsEV1F3gWuD21hDa5gh21+Du2l0UJ/
 Iic2m0dw9UNq255VgNjGXUu9+uiaEDcuTH6fGgtPPRnSdSfbBW9Y0RJ9joGKu0M2yz8gH7La+1Z
 Sj1VGpqZ/fMKK96hUZ8GcEVyWqgGS2P7jST2BTd0GAcuLN3QyxXoWwf1ZRYSY2Qs1ELSzYZ8Sdv
 4Eiz5qpJ1UzA+55S+IHOzheACFC+lgeaEhCY8tOQ+TQQyCmXd5JsQCAbdc+wFjVZtXw2ifzc5ES
 DSd4rE+BSFPp9XBnHtw==
X-Authority-Analysis: v=2.4 cv=UO3t2ify c=1 sm=1 tr=0 ts=6a9e377f cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=UqCG9HQmAAAA:8 a=EUspDBNiAAAA:8 a=J1aC8j_Z7Edc-Vy2RqkA:9 a=CjuIK1q_8ugA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-GUID: aE27NuDMSR9ZIMBMg89UoyoQGtViRBmq
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTA3MDAzOSBTYWx0ZWRfXwRZ8DQBVTlpT
 BHkvUCgz4FU/tA9fYhD25/CK0Bt0TSlyiGbtqOSntxMxL717lSV9Ei8HmPsVGX8x58fZAG8vZgM
 siK+A9zu2YSwsSD5ZlvvOvrkpjrq/34=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-07_01,2026-09-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2609070039

On Sun, Sep 06, 2026 at 07:52:40AM +0400, George Moussalem via B4 Relay wrote:
> From: George Moussalem <george.moussalem@outlook.com>
>
> Add ability to pass the reference clock rate from the glue layer to the
> DWC3 core driver. The core calculates the reference clock period and
> frame length adjustment based on the reference clock rate.
>
> In the flattened snsp-dwc3 model, it is currently not possible to pass a
> reference clock that differs from the default since:
> commit 613a2e655d4d ("usb: dwc3: core: Expose core driver as library")
>
> The new glue layers (incl. Qualcomm's) set the ignore_clocks_and_resets
> flag in dwc3_probe_data to true, which disables the core driver's clock
> management, thus it also doesn't acquire the reference clock from the
> devicetree needed in dwc3_ref_clk_period.
>
> There's an existing DT property 'snps,ref-clock-period-ns', but that's
> been deprecated. In addition, basing the rate from the period is often
> not accurate enough to derive the frame length adjustment value.
>
> This prevents moving chipsets such as IPQ5018, IPQ6018, IPQ5332, IPQ5424
> and IPQ9574 with a reference clock rate that computes values for the
> period and frame length adjustment different from the hardware default
> from moving to the flattened model.
>
> So, add ability to set the reference clock rate in dwc3_probe_data, then
> have the core obtain the clock rate and use that to calculate the
> required period and frame length adjustment.
>
> Signed-off-by: George Moussalem <george.moussalem@outlook.com>

Reviewed-by: Varadarajan Narayanan <varadarajan.narayanan@oss.qualcomm.com>

