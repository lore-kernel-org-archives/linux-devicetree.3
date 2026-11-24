Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795488434;
	b=wnIoOR5s0Y39OuoV2Qatu3Ole0o7h9WimUj6JqWz5o9W+CMjSbegD+fL18KcLGmN/qFq
	 +0+YIh1iZgDBoDOK7hJxQyMrQgRCnwzQTt3+T4EEr7CWlWD8CxFyAvZug8AMyLNioQsYc
	 8XXkHhWssOhFnS1Elwb8cPM716p5SdLMoTlWeYN79LgCLkAdrmsiM/EfDt3KE6Waa5AYa
	 zJOX1EZZMBMbrU5hyaPgDX5Ol4yShKAkjqckSqTKzFZV39X03o986EwMUq4Z5kQJ9/vge
	 f/rIJb41pDtDV2cQbHQ8qxshkCPIL0EKvSgUOeLSnPehYot2GwqGvnREezP6v9kz1Tw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795488434;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=9H02wQlFdIPXluo4QYcyx4DfthKEsjHhuAsKhNR0hjA=;
	b=HImrD5E2tDoNL6pIcIh/jaiEj0OwfWy/HltF8CO7nETPYIt64y7doPC3VSOdMn2FVNBx
	 dsr8CD2XpuaUdrba7kj+FByXiXvSKoMmdopnhOjILuQ8wJ1Gm/87Qar7dLxnH37J3yprK
	 WWakRzw+pux/nJk2oci0yR/y44VfjnTVwcjq1JKhN1R6MBOH8rf2HHDit3VP+wXOFruQT
	 b0iY8UtVV1+qfVAhLIFxJCEos8/C7h6uS6UwocALzXqN60UGQqwmOf99sa40x4wPDALQp
	 N3829RjR115angVJR1d6XUdg2phmV6zGBTV6GH4HKHHKRa5JTgh/bVcRjGy1dw/ewKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bQZe0YDz;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6RMTDn6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4DFD606A322
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:47:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D4DFD606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bQZe0YDz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=f6RMTDn6
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AO2kU7s647161
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:47:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=9H02wQlFdIPXluo4QYcyx4Df
	thKEsjHhuAsKhNR0hjA=; b=bQZe0YDzTkdonnXeELT7B9bA5TvvL92s3bCTVn7M
	INPDPoc5ractfCsOpm42KbDBPg8nxqVwYIumL6eKqSXXHa5PwMGJCR41TZsM3qH/
	qKqevsUVrqeLA0+3gV+eDwI+1pCN4FtCzJowkA6aBZ0d3D0zr7n7ZKPJD2r2LgCG
	Zr2COTTb67s8McvamY+innqVWzw1pE4dQZZkRO88ekqQG9XA8dmy48vGmXpIyWmF
	ogU1BNiY8ORaoDhWOb5OJ3BNCQr0tDGsQqKwgcmE+4m702gTlYEsUTHEbcEA7R4w
	+Wfd4mfk0g3fjGkPbxaMBdvQCwdSYPQEoI7DCwqRNW+9Rg==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4yvd0e4a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 24 Nov 2026 02:47:12 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a5005fd0f8so1717220c88.0
        for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 18:47:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795488431; x=1796093231; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9H02wQlFdIPXluo4QYcyx4DfthKEsjHhuAsKhNR0hjA=;
        b=f6RMTDn6Tmfd0ZSrSOSC3+JbNh2ZP17Tlt61KAVN/R+IbW2mN80hX2n9bDG1N5AFol
         Jj0lzZwNe3ekT2u1ne1UBYbb7BkDGV1P7RoO/S3qbCeIoKiq+gN1HLpN9MONJVNYOPiu
         ryi96NEtui9m43xlKG9SlG5y5lZdwLcmRZ9101bqcEkdug1hA/LPJgaNQGR3hhZOnXXE
         Vh2jHw726jA/nOVEYbcAOW3qfeLwAwxBKInGf2XvHm9YYXjkNnx4wH7EUmDJ2chM92ml
         ROPomxEHU+a9GJMIIM+gk6B5XIM//oDBtf/gXQdu3hw7GPtdUscBIaV3eO4bDwBNzAOg
         S1nQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795488431; x=1796093231;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9H02wQlFdIPXluo4QYcyx4DfthKEsjHhuAsKhNR0hjA=;
        b=ikVf/mIo4P8bMZiwZ59wwJTjbOoeOIDcumfhk+Y/0MhwRXzzoF0PfoHQVqd09yPYca
         IVEDYaM+X2FJZuv0AZrnffhobbkBAxXUhGS7yRBKqYS94EI6gAX36MBhVar/U/ufPtXS
         lAImFaGUr/VY/yDW5qnmzY2vbAKlx2yo9XGRmniSm3qQ2NvZmK/u5hZS4iT6Q3VjYzq/
         ynrjW0pJSUeztZznfkbwgYDCi7ObGSigf9puJnMDlIEm2/4dvx4IYqJkSCH3cPayctyR
         +2LyPl44klU+PFVdAWpB03Ux5C9sl0C71L9iqinTA+Ron+ItOW8xOYEKwRksMXlc8wx5
         mNhA==
X-Forwarded-Encrypted: i=1; AL+hErG4xpuYcdO9QheI4t3zQmMWQXQgKrUR1/pdV4YhEY9nnZeca8O/bNCID3jq49ELv7wPkfMw5ilWqdED@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y7p+MNkaY/rF+cTju/yRQjSza+qwoT3j/rYjBX3OZDQrsUZE1
	9eTIFW+bIyr2GaMZmdwtK2sUWVSHRkvUA6qfXJxTHhytFb1Pq1UuD1QK/XEQzc5iurLUnWfWddz
	3u0JW12Ace82MzrJuNQgWf4GB4IOyen9FPZnVcJ1BA+572JyeDfCQbTINrnJb14dJ
X-Gm-Gg: AZFdTZffOqY7+yU/8mnZ3XPT3jynHZQTxqtFEV65sGKOC7IlTpxzN9V8L2xGTkxbFkk
	CPuL4vEtl+q7MmW3aNT2NFGy1yYmYBvFx8EFVDQgnXAIL4sE30htPPh8pe0lIWe/1jj1PRPffsV
	P6dWXbCoDXdmh21gbo8hOXHI/tIqoIxsuP6lRfFhCccngPn9NbF6iedc3a4RJ4DXfvPNnrBk/pv
	B7TrYW7ndSpR0r2jxqtvRJXXeaO/OgXiLPBAkEXjLhScx5m90F8fPDAqbCVlrE04H0/7mxcieJH
	3TgGXK7farH3ShVmeGKA120AbQsxNsyphvjy5Osv1WzOT37v5gsTDVV2j26KK17hDe3M5QYNjYW
	BAjzi/SVdiTEilWimmxwlMTQdr7f8qxCkvz8VhwKtK4AgHV9XxvElrP3UlStneLsQjUy3pxTBKt
	BSAWFk3jIKx9HkJlUgEHA6tKs=
X-Received: by 2002:a05:7022:2608:b0:1b5:342a:e4f0 with SMTP id a92af1059eb24-1b5568b678fmr18621056c88.6.1795488431292;
        Mon, 23 Nov 2026 18:47:11 -0800 (PST)
X-Received: by 2002:a05:7022:2608:b0:1b5:342a:e4f0 with SMTP id a92af1059eb24-1b5568b678fmr18621015c88.6.1795488430785;
        Mon, 23 Nov 2026 18:47:10 -0800 (PST)
Received: from hu-petche-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm35685565c88.13.2026.11.23.18.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 18:47:10 -0800 (PST)
Date: Mon, 23 Nov 2026 18:47:07 -0800
From: Peter Chen <peter.chen@oss.qualcomm.com>
To: Joonhoe Kim <26rote@gmail.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, andersson@kernel.org,
        konradybcio@kernel.org, heikki.krogerus@linux.intel.com,
        abel.vesa@oss.qualcomm.com, abelvesa@kernel.org,
        wesley.cheng@oss.qualcomm.com, krishna.kurapati@oss.qualcomm.com,
        konrad.dybcio@oss.qualcomm.com, dmitry.baryshkov@oss.qualcomm.com,
        neil.armstrong@linaro.org, val@packett.cool,
        balaji.kalkonda@oss.qualcomm.com, tvlad744@gmail.com,
        effeffe99@gmail.com, prashanth.k@oss.qualcomm.com,
        yongxing.mou@oss.qualcomm.com, tapas.rana@oss.qualcomm.com,
        vkoul@kernel.org, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jack.pham@oss.qualcomm.com
Subject: Re: [PATCH v4 0/2] usb: dwc3: qcom: Keep USB 2.0 working in
 DisplayPort-only modes
Message-ID: <awT6qwRVeAuPRBth@hu-petche-lv.qualcomm.com>
References: <20261119124558.1548-1-26rote@gmail.com>
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
In-Reply-To: <20261119124558.1548-1-26rote@gmail.com>
X-Authority-Analysis: v=2.4 cv=ZYeIpcVA c=1 sm=1 tr=0 ts=6b04fab0 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=dLxMsxsk7CsyiYUDLEoA:9
 a=CjuIK1q_8ugA:10 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDAxMCBTYWx0ZWRfX/ShDaMOTLyCx
 L/OQfK8I6La9oLdezd5f2oUPfXj4TFPgmb4OlwQYwTymrTxrDV2FVGSR60DZmdLVa0puUuqABMX
 4ZyOPmV3EcdItV2k6lNg0I58SopZhfbP1M7pM/yHCEqtWWHzdOiT2LC9WkGwYRrvA+ZmF4mfZk6
 SIWPr70vLNy3V8e8djpy73TDRCzBf3S52Qg9LftFXIBNMhMm56gBtRltb9fN+8RUrBoctn/EwkI
 C7Gf995n02pnTZUrO9SrjLY7o8aDOn5wlrJ9+3n8kpQveUuea1bqSkCEoDv3bj419gIioX8E8iS
 njyGkKYqgb8ylwiOrSBLqZTuSfmB1b6zlZNyGyTry0cuHtNpuzBSz1cfyBkUNcLcW4ioWxPE9rJ
 jdVtZ4bYga2eq4msQvQ3qaTVmwS/qJ5QxhjZcq7ZrXm6/TQaCkLvSwCDsC8fvcGEnpu2hh9mTNE
 U5vTqqbq0V6aqzJnplQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDAxMCBTYWx0ZWRfX5Kw7e2Ayk5Fi
 VLsu4xnPcwrukqd30i7MNiwmT86w4NaMcfgiEhF1uzWpem0FKCZZl2kCUps1prl2Kfe3eakHv7M
 owwIijrzR8HIHnKoO1orktZ755nS1PA=
X-Proofpoint-ORIG-GUID: AheyOIi3kqshYG7U5zOeSxtWwQ6G-HLd
X-Proofpoint-GUID: AheyOIi3kqshYG7U5zOeSxtWwQ6G-HLd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 impostorscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240010

On 26-11-19 21:45:56, Joonhoe Kim wrote:
> With a USB-C monitor in DisplayPort pin assignment C or E, the QMP
> USB3-DP combo PHY gives all four lanes to DisplayPort and keeps its USB
> PCS powered down. The USB 2.0 pair still works, and such monitors often
> have a USB 2.0 hub, but the dwc3 controller still runs from the USB3
> PIPE clock. On Kaanapali the next xHCI reset in this state times out
> ("Host halt failed, -110"). USB stays lost until the cable is replugged.
> Commit f546912bcac6 ("phy: qcom: qmp-combo: Move pipe_clk on/off to
> common") keeps the pipe clock branch enabled. That is not enough here.
> 
> This series registers the dwc3 glue as a Type-C mode switch next to the
> PHY, so that it gets the mode (it does not route any signals). In
> DP-only modes it moves the controller to the UTMI clock, as
> "qcom,select-utmi-as-pipe-clk" does statically, before the PHY switches.
> 
> Peter Chen suggested on v2 that the PHY could notify the controller
> instead [1]. This series uses the existing Type-C mux framework:
> typec_mux_set() calls each mode switch linked from the connector in
> graph order, and the controller (HS port) comes before the PHY (SS
> port), so no new PHY-to-controller interface is needed. The cost is a
> "mode-switch" property on each controller node. If a notification from
> the PHY is preferred, the clock selection in patch 2 can be driven from
> it instead.

Hi Joonhoe,

Thanks for explaining the trade-off in the cover letter, I may
still prefer that the PHY notifies the controller is better, for
the reasons below.

- The controller may not know well what the PHY really did or is going
to do:

   qmp_combo_typec_mux_set() has its own policy. It does not
   reconfigure while DP is powered on, and it skips the switch when
   the PHY is not initialized
   (drivers/phy/qualcomm/phy-qcom-qmp-combo.c):

	if (qmp->qmpphy_mode != QMPPHY_MODE_USB3_ONLY && qmp->dp_powered_on) {
		dev_dbg(qmp->dev, "typec_mux_set: DP PHY is still in use, delaying switch\n");
		return 0;
	}

	/* The mux still receives Type-C events, even if all PHYs are uninitialized */
	if (!qmp->init_count)
		return 0;

At above cases, no switch clock from PIPE to UMTI is needed.
If qmp-combo calls the controller right before it tears the PHY down
and again after it brings it up with the new mode, the controller does
not add wrong or useless settings. It uses the UTMI clock while the
PHY is being reconfigured, and goes back to the PIPE clock only if the
new mode has USB3.

- Once DT ABI is added, it combines the kernel code with DTS. It needs
to maintain both DT property (graph) and kernel code correctly, eg,
it also depends on the layout at pmic-glink node. If using PHY notifies
controller solution, it adapts for all related SoCs, and no dts
dependencies. 

Thinh, What's your opinion?

Peter

> 
> On Kaanapali the PHY becomes a mode switch with Balaji Kalkonda's
> DisplayPort series [2]. The controller side for that SoC is a DTS patch
> sent separately to the Qualcomm tree [3], and Tapas Rana has sent the
> same for Glymur [4]. Neither should be applied before patch 2: once the
> controller node has "mode-switch", pmic_glink_altmode defers its probe
> until dwc3-qcom registers the mux, which only patch 2 does.
> 
> Patch 2 is on top of Filippo Falezza's "usb: dwc3: qcom: Restore UTMI
> PIPE clock on resume" [5] and reads the selected clock back from
> QSCRATCH, which loses its contents in system suspend on SM7250. [5] is
> still under review; patch 2 will be rebased if it changes.
> 
> Patch 2 adds "depends on TYPEC || TYPEC=n" to USB_DWC3_QCOM, so with the
> arm64 defconfig (TYPEC=m) dwc3-qcom is built as a module.
> pmic_glink_altmode then probes later, and a monitor attached at boot
> depends on Yongxing Mou's "drm/bridge: aux-hpd-bridge: replay last HPD
> status on hpd_enable" [6] to be detected.
> 
> Tested on a Lenovo Y700 Gen 5 (TB323FU, Kaanapali) with the series
> backported to a v7.3-based tree that also has [2], [3] and [5], with a
> USB-C monitor that has an MST hub (two displays, DisplayPort over four
> lanes) and a USB 2.0 hub. On each of 5 plugs the controller switched to
> the UTMI clock 1-2 ms before the PHY switched, back to the PIPE clock on
> the next USB state, and the monitor's hub enumerated. After each of
> three s2idle cycles with the monitor attached, both displays and the hub
> came back. Plugging the monitor in during s2idle woke the tablet. The
> mode arrived after the glue had resumed and was applied right away,
> before the PHY switched (once with each clock selected beforehand); the
> path that applies a recorded state on resume was not hit. A USB-C hub
> with DisplayPort and USB 3 kept the PIPE clock, and a USB 3 stick on it
> ran at SuperSpeed.
> 
> Changes in v4:
> - Patch 1: add Reviewed-by from Krzysztof
> - Patch 2: mutex_lock()/mutex_unlock() where nothing returns early
>   (Krzysztof)
> - Patch 2: leave the probe code as it was apart from the new argument
>   (Krzysztof)
> - Rebase on next-20261118
> - Link to v3: https://lore.kernel.org/all/20261112113838.506-1-26rote@gmail.com/
> 
> [1] https://lore.kernel.org/all/avZ7-Ax-_VwcJhYG@hu-petche-lv.qualcomm.com/
> [2] https://lore.kernel.org/all/20261022-kaanapali_dp-v3-0-b5ae8e6083c3@oss.qualcomm.com/
> [3] https://lore.kernel.org/all/20261112113921.1143-1-26rote@gmail.com/
> [4] https://lore.kernel.org/all/20261117113834.925310-1-tapas.rana@oss.qualcomm.com/
> [5] https://lore.kernel.org/all/20261027-dwc3-utmi-resume-v1-1-ca9f0aa65783@gmail.com/
> [6] https://lore.kernel.org/all/20260803-drm-usbdp-preboot-v1-1-2539b362be00@oss.qualcomm.com/
> 
> Joonhoe Kim (2):
>   dt-bindings: usb: qcom,snps-dwc3: Add mode-switch
>   usb: dwc3: qcom: Use the UTMI clock as PIPE clock in DisplayPort-only
>     modes
> 
>  .../bindings/usb/qcom,snps-dwc3.yaml          |   5 +
>  drivers/usb/dwc3/Kconfig                      |   1 +
>  drivers/usb/dwc3/dwc3-qcom.c                  | 150 ++++++++++++++++--
>  3 files changed, 143 insertions(+), 13 deletions(-)
> 
> 
> base-commit: e8017d29067fd1310a65c3494ce1a1b492adbac6
> prerequisite-patch-id: a793fca7329dac964c21459f8d7a8b003d36d84d
> -- 
> 2.53.0
> 

-- 

Thanks,
Peter Chen
