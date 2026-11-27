Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795788450;
	b=2Aw0zvyWuR/trJDkNH8Ko5JiHaGrC9plHo1btMDOFlrJtFRK21nzTvm16M/iUYbgz/88
	 U7UimJW5uvCixmAJDqjiuruwNHhn3IZ/tJ2rwShrTrDLg9QWOwfDQQAJIbXYqdMTPwB7E
	 Gf0Bp1M2z53VNnHV72ME7jcz/uLxIhwABGoIqlXSohulSf1IWji5H9ms3nOW7+wGY/nRi
	 tw+/DrvdCrVQ5ktzOlWqh1EhD7U6+aUd6nHt8qyHJFIdzmdmtSUqL5+4SahCfw9sumurq
	 VGJoCFqc8hyfuLRyBIWQ7fi+AJS5pljClIIa/w857mAH/kto9g5JRBRw5WTSVk4VR5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795788450;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=YfbNWHn/IWj+x0bqlZdsPj/C6tp7qzwGnV511Fr7BTo=;
	b=mDISr8KtOBt18cpWY9DXhq0M0ZKY77ovKMW4CmNmALyzq6ZYCYgcjfGDIJ/R8Z593Keg
	 eki4Wftqx//slMVqiwd8ebYSFjaZXPcPNM31rLvI+vfj0dxUUw/eYqPCxu9VIrbisoHG0
	 ZnlmDlgndk+/GrHAn9/6il7cIB49mIqmwOdoIq549scKew8ILUPELNh4bgmPIH3Q6d9Ys
	 DmgXXDR82bH3isJiEo6S96SWe29J3SdM+KlTQG7GIsvFKgGmna6av1YDzHGph/krqLxNB
	 epaKq3hzVlWp2RCZthBuR8v3rd6s46ZEPF6/VFcxFVIfauko0NuKaiMLEZzzQbHktkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMe7A6H7;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xnv3NMK9;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E341D606A323
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:07:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E341D606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bMe7A6H7;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Xnv3NMK9
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ARE1GoK2376245
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:07:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	YfbNWHn/IWj+x0bqlZdsPj/C6tp7qzwGnV511Fr7BTo=; b=bMe7A6H7rINkNX6B
	tJyA9vfBd9gPTs1oO/dYBnZpI3HzGyk7uzG12g2E88LZkqyOjF+LQiFT2XHonoe2
	zNkZnVcZxmGmWfXAgNOH5iTo7w/m5scnVAqaPbLWGXoSUxYoKL+smb2QWB6c05m7
	GD7Tu1rnekQv4hKH9gO06IDsoFiX9WN6OKmKrWD9kiRJfbVeYAqpcrQqR6Qp6Z62
	BDxYiLfTLKvNCTiWYZFe3oGrmfM6x/ef59MjmJshz8mCBFx061w1XR6iou0D7G5w
	HyBBSR+3St9M9O4cItvHhIkz79YUml+ZeRma1O+wPVpool7OBLn9QOJ9gKxu4kiA
	usJXlw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6u4huc5v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 14:07:29 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-71ac732da3eso195706eaf.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 06:07:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795788448; x=1796393248; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YfbNWHn/IWj+x0bqlZdsPj/C6tp7qzwGnV511Fr7BTo=;
        b=Xnv3NMK9Eiil9yGrafgxmdi3RhQ70D0RVMepl94sRnyPL296QYn5DXXgrf8Lu8g8ee
         qJHsWOCNUb6MWl0NLNjB1DTyGtUZsEoT/cr2Bd+01uOW0I8ZF5ux+tTpBXPuS/5eMgHo
         qZv2V9UMJbMu5JKJeDrv4aAHboXQxCBsVhKevoek1NG5UXgitayd+RikhAXfv/1HnIvR
         QeHKcmLNLozsxfjLkf1iEg/xw8cNtba6j4uklUkDNaXSbtuedBnScQESaLSDwYffVmZv
         L6ym6yPX5NGWKV33s0Ux+RETCFMETHxOiJoXVUQB0tRH6xolpyJPdjtZ8ixvLehNeKHw
         Mmgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795788448; x=1796393248;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YfbNWHn/IWj+x0bqlZdsPj/C6tp7qzwGnV511Fr7BTo=;
        b=KCgSoTd6C57lijsK2xWt5g9okd6brdK1yswd7XVNsTcHdJ8uw/OQ0oyKbPLheNgARO
         MaSOSjUzAhGwT702MVzZ6PpkOUBKCmkYDxCjBseVfLgv1o/Y9HDV/ibwoPOXflbyWeHd
         jM/an7rU3LGnCzKnEJ3egspA1DGV1DE0DCAJeyMoaXW1GnibKl8rfik10NF5cpVCubRH
         djKOyCFd0DGULFU6ByQ/VA7bV3pn0RJwwsSp2bIGTD+i97sFLRenW4Cr9Pkk00cOfeYy
         ulPHYC8rvgle40Mu9bJ+VrH0u4vbWi47IC1yzQ3aKmj/4XPKhYreBXT+vDUxq9i23d1O
         IErA==
X-Forwarded-Encrypted: i=1; AL+hErEskmxGV/p6Z75lOgZHO4f50zy/6VvdpOPncIs9vm+UMEzbyDZqPqbhluBrJ38Fo/jMpTdBvdBYfxDi@vger.kernel.org
X-Gm-Message-State: APuU4Z9Zd0p9XvTm1gVJT7qJ13pJJRzXD7s6rTeDBw7Go093fPlcyJVz
	AOvw1X11LCn9mH3KsZqVhleFBsKLXi5wnY0Vpmj28U6lXmgMsL0/+O5Wu30aSs0B8L2iXeirxB/
	+HI1rwKgFGBHuASymi8JKcGh4KoK4OC1KenM8AurJcGOxEr1Fnq5y8bOYaX80jAoo
X-Gm-Gg: AZFdTZcfnPaNpdyWFJper/L6juYbpLo+Z58Yf9ehSdDJJkhfABiTXAEu/xJ/DTyWKZu
	hZjXX2JwTMoI9hTAj2iM54cQ0NVHi9if9e5HQoMmyNTgREHQW427ss03Ws5+H093QSnET1HQJwn
	YFSOsEHrti+q/SSxwIsD9/FTYVge2R2GloDrCrecbdktDX/tEKjFT82PR1Vui6fVDetoJkjWFiR
	H+sIwJNrkafQpHuT4uOtELe7UlWFxQhKnyj+iAZO4XfLAm6+Dk8XYqVD1sY9MDNjTQn7tPQrGy+
	RxXUXjBWDrxJHt1Lr1hXZ19eZuSCYJXwaK/SDHsES9tqxKvRvHijqDsnkieIk7+xaWF5IuwKPaH
	LR4vxkyPzC0A1o8Fq/jP8/Iq60XaB/aLSBxzvdhM2pys5HNXgsKqdQ0lvCZzFLg6E0uWoPnA=
X-Received: by 2002:a05:6820:c0db:10b0:6d9:f62c:2698 with SMTP id 006d021491bc7-71b392f5007mr22283708eaf.1.1795788448213;
        Fri, 27 Nov 2026 06:07:28 -0800 (PST)
X-Received: by 2002:a05:6820:c0db:10b0:6d9:f62c:2698 with SMTP id 006d021491bc7-71b392f5007mr22283631eaf.1.1795788447720;
        Fri, 27 Nov 2026 06:07:27 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd0776edsm6211739e87.73.2026.11.27.06.07.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 06:07:26 -0800 (PST)
Message-ID: <da7b034f-d1e5-4e37-bdf2-22364d5c045c@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 15:07:20 +0100
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
Subject: Re: [PATCH v3 13/14] arm64: dts: qcom: Add initial Halliday dtsi
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        iommu@lists.linux.dev, linux-usb@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-scsi@vger.kernel.org,
        linux-crypto@vger.kernel.org, linux-pm@vger.kernel.org
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com>
 <20261125-halliday-dts-v3-13-5c8311c0b70b@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261125-halliday-dts-v3-13-5c8311c0b70b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfXzEACixn4yy0r
 uAvFznZH+ruH/MZc3BfMPbmHVvHBcfvI5fdxJLa5gc3herp1Uc1XDyqnP7GvO6YVk6fe2hg2X6F
 l7DbgKrh2iD074ZkYr7L6eO/hQ1glNg=
X-Proofpoint-GUID: FdBPv7h2K2WOT56rGjy2d38-u5KR_1st
X-Proofpoint-ORIG-GUID: FdBPv7h2K2WOT56rGjy2d38-u5KR_1st
X-Authority-Analysis: v=2.4 cv=M9fYuCws c=1 sm=1 tr=0 ts=6b098ea1 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=pIfNyjNAQl_vEFP8Sf4A:9 a=QEXdDO2ut3YA:10
 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDA1NiBTYWx0ZWRfX3rVcV2B/tYsv
 nHiUFmcH8ep0btJrv5vmtNyCxygKcrzeIyEo7X9e/OKS1uHyqs27HdWEQ9S0zh2B0/ftk/RIAOd
 hq8B/EjeV6t17LZXO+I4J5DaAovObCIfhyXa3KOBw/sDBAKHz5bT262Jpo/+glhzAYRhiJyTGKG
 L3iLhY3W/hyDkZP4hp1hRJibWHF7ZKWaqRF0i2x7o6Vx6gcr912UzKoKF0I2H8u3h6GdTiWsaqy
 nQp+s8GCXAtnd0rD7r9erbO54FqDb7YwJazuwzGz7a2G5xPjo1LyL6z2Bw1lumBxX3EqsqXOYfF
 uMYGWqZTS3A8Tjwg1s33b45gzjhfBpLBkYukffyQqmW6KqLAxXwLHM4XRCnS0SixtU69GqXcUs6
 dyRGXt9UGdExmtCBthNlEDqS7ENjAZ46ZAiuytQY3UlCbUdf6pHXouhg0snwvAIuloL6sqPIgIq
 AYL6cKOl4agyKtOYfCA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-27_02,2026-11-27_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270056

On 11/25/26 4:43 AM, Stanislav Aleksandrov wrote:
> Add the device tree for the Qualcomm Halliday SoC
> (SXR2250P / Snapdragon XR2+ Gen 2).
> 
> It describes the CPUs with their idle states, cpufreq and OPP tables,
> the GIC and the PDC, the timers, SCM, SMEM, RPMh with its clocks, power
> domains and interconnects, TLMM, GCC, SPMI, the apps SMMU, USB, UFS
> with ICE, TSENS with the thermal zones and the PMU.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
