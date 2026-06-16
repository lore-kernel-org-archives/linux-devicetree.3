Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AC3F377558
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781568054; cv=none; b=TAs8Qm4sWidpTFPqyql2cLYR6s4mtSveAWRCDeGpSA8OIdcSPvXekqm5Z3ydsOgJNwOQJhOHwflqu1dP+pldvdeM5Jk9KbpQxWks+CwC/m2QFrYmisjE19AphEFBF2JDiziyn6ZZGbrDY80zywvLk09REjtZ4IYfOXytIhEu3xU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781568054; c=relaxed/simple;
	bh=sPlwMsV02UK0G4gKr2vmcvU6v1fJGwm4rA2BCharOu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c7lkD0iM2dsVpNqfX5F2NwiOIXdQvns1cBmb4/Zpm1mfXqTUmwjVTNELE3TE4CI+Xn04bB+SoTcOg2EH2VuviKhClraZNjxB+ns84zEJnNoQELDtGpUxUp2s0sZVPNzTkFlSswhGN69JuBn4JLidQEcv0kSHspxQASqd7zwJqQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gn2Kv1VP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=WUaKuv+l; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gn2Kv1VP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="WUaKuv+l"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FIx0kv881748
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:00:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=1Vg2K6B16Dhox4exOM6MbaMm
	j5rDGhMALYTozLTw9eU=; b=gn2Kv1VPoyQNKGRRKZXoq85Yy93c6UK7ZB0F6LRM
	Xm2yByPEYATBLP5k85s0ePBn0wuCsJe9cYXYTYQUKR990dpDVbEx5A5FXODRh5f/
	H8p6EFac9TVVaIK5XkmhUFFBkAvFQ2cqrquLxgdhwU5ULpjsiWBrZX3dE6w+zynH
	rVAAxsdGxl5MJpOlYMfg8Oz6DzfdPMXUebxxM8lDSkXHlAzHm2iNw0zcHKmrAvMv
	FERgsijPXFGYrIFIm3HSH7X0JMcr+l0nGY3jYHsl992DaMY4Y8CeG7oizCZ4xGFv
	spnVbjPRLnDPdlkuFYQTZeX9tt4d/Y+0CFElTR9bpSxZtQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etew0kp7x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 16 Jun 2026 00:00:52 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-91565f8c589so691204585a.0
        for <devicetree@vger.kernel.org>; Mon, 15 Jun 2026 17:00:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781568052; x=1782172852; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1Vg2K6B16Dhox4exOM6MbaMmj5rDGhMALYTozLTw9eU=;
        b=WUaKuv+lfn5lLRK0lv8gvZnep2SoZ4BStdOEoh6YMWEQScDLzgfhBc4CQeHz9jVV48
         bncOtvvwea7t7bfTb64i1k6CFMjFmRjrlHmlX62ElRN7FMAZts67mfYeZyFQG40Bk1IA
         bd4aVMV8seLyS87Csg1VUvifvnDNpXESD3h/zmgsCMCmSh/IsT460rVJzMR2CuEp5jLW
         sm/H2cYe+qlMMej5SI0v1e3yKc9VzeZzcltWKK3PtaTpUYgY2E/HIXYDYe/t1CPJnxM8
         CKuavQiWHAtm4awJe3B8lDPzNnYx87A8PX1ubmlnC/aAKm8Up9xhR5uktFSlI7iTqpRo
         SrVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781568052; x=1782172852;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1Vg2K6B16Dhox4exOM6MbaMmj5rDGhMALYTozLTw9eU=;
        b=qa/uRR8tvsHNpRTKLe4XPGN1vj9X/dm1nDLi2IgU3+9neyUKjDlQjyVTQAhS/S+2dl
         x+gbbh/bAIO6RTRy+03GIstMKjrK7INcwhDwYWxZpj62V3WKCIAoVJ1LATkGavk7XF8C
         r7ON9TfbIquQD9Tn5gRdzFKqpZwVg6lIUEnIlj95sgnoF9iF8SJPWWFCYrEy05ZZ60is
         pJKcnc0v/2HLNa7qwUC/nqiQLwi5WE6jZMI4Aopo1xEW7uSy0+0bM632G3fqF5cHeB35
         fpz9PJZnoQ8/u3Kiaaa8P3/6D23gi6fDSWwSdJZ0Z56yXxP5m/peF5jfXhDj5jjU2rwo
         BKhQ==
X-Forwarded-Encrypted: i=1; AFNElJ/sEq1eknpOB58AQ/iDCp8gOrJ8LEtGIYtSVgcz2xVD85BLvDF0AtaycTDiqnfPHDIPOB9X0an3pVT+@vger.kernel.org
X-Gm-Message-State: AOJu0YzjRzKIFTC3T6KSjVAW8tsjE5PncPZFS3G9dPF2KvkQvzf+2SM/
	dkLm9Hu1AcwTbtwZo55D6iz4a62IaPPoQiVCOxqn58BiwUGvUqzx5hel2t1vcXmw/wVDc0RG9xi
	zOaedno1fi3/v5SHNLW8z6uqyMhhhhlY2Xu4PNbTEd20SKHFREKYNPkSZI89ZW29y
X-Gm-Gg: Acq92OHU2Vw9dkgvEEKgNzznwUDg+FoqHOepcY50PELBe47fQ+b+rbZTg6Log8ROicE
	BUp57QHEPypUOpU6Os7dKiqO6WzKW5jEOncmZVutg124e6ykCO9vIX7IONqqZqBLpPClCGpaF4s
	vzB8QqThseIXp9rC0KX7rWWdTeYXQlUevMG+gcaZa55NVuZMtBiJEJf67727jmvnUnNJsnH2Yia
	MMbhoR22hDH/rvtwYiVPMXwALnkLk9JFSUKGHrIf1nnMnyoJN9HDSvwFPDapbZ/jvBn6xQOJnOU
	fCX2VQCbCYCQ1SosBbGv+PifCPwiGQwDRCMjEkskFGCMS4AvUbQa1AheRJGbpk9ph372SCrwOT4
	Aknc9925Q9QvX5QWa6tLqlW5NwMwxuU4w/t+8WvrIPIWQ3dzR0LxI/uYOrM5hvQySm/lz7AEzyp
	NLQjLz0ZCWH66jFIdF7zOA1jPFF56ccnAKvQM=
X-Received: by 2002:a05:620a:4147:b0:914:d65e:4660 with SMTP id af79cd13be357-91c2fe7e547mr243136985a.42.1781568051785;
        Mon, 15 Jun 2026 17:00:51 -0700 (PDT)
X-Received: by 2002:a05:620a:4147:b0:914:d65e:4660 with SMTP id af79cd13be357-91c2fe7e547mr243129985a.42.1781568051306;
        Mon, 15 Jun 2026 17:00:51 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5ad2e1a7283sm3075116e87.39.2026.06.15.17.00.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 17:00:48 -0700 (PDT)
Date: Tue, 16 Jun 2026 03:00:46 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC v3 4/6] arm64: dts: qcom: sm8550-hdk: add SPMI ADC
 channels and thermal nodes
Message-ID: <qgjntewdw2qesvkeabvx46zxcwrikvpkgthk7e2cqw7biuhmqt@2khmbjh2dt26>
References: <20260615-topic-sm8x50-adc5-gen3-v3-0-216a2b5ccb85@linaro.org>
 <20260615-topic-sm8x50-adc5-gen3-v3-4-216a2b5ccb85@linaro.org>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260615-topic-sm8x50-adc5-gen3-v3-4-216a2b5ccb85@linaro.org>
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfX8BU10nPGYuR4
 K7b26qk6greuQdNVuncKKDk/SYm8DjSFYH4i08A8kJlkA8xwkH8Mk1j1mf1aHm9372NJGqG4q1j
 1rS2boeasoiDQsuTRxz7Gh4MNvF/4yA=
X-Authority-Analysis: v=2.4 cv=QLlYgALL c=1 sm=1 tr=0 ts=6a309234 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8
 a=cdGb-ScAzFlxXzt0GVcA:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDI1MyBTYWx0ZWRfXx4U5znGHL+2N
 0NgMmxkfN0dQTdzHDEGNyA/cJuDRi3Nex7iMpwz+0qZIJaeBdLj4sBojgNOl9iAPbiYpnUhBvCe
 vgz2ltnrtgShNP4sKYa0JOG0EF/R9APMwcoPYsDbcBV0wuBf1Zo/wfcNoBjKYH6BFfv+mydSpYw
 j8UkQNH55H4IEY0tRSVfu4B3bbyMiMlSHJKhA3FKxtPVyrNi0mWpYsxdaeE7JYkRaQYrtDTiSFJ
 66D9kjYTWic+EnC3dIwxn2LzWU0MrMkjsdIvs9hrxR2ZB6zRtDLfgRzeET4AT2p3I7sRxES5crL
 pxj93F9fN9JZfsBlL7qDwXV9r15QUMFMPxov7JD+iEQw0YO5Ews+yCf2c0DfGA3z1h82JB5ZwEy
 XdxuROFAkNstWpYOEGRZyvD4LzhENxSAPHfqIm4CBluedpNFyQX5g/a+l9O08OG/TYVeNa16RWn
 mbrKz5O7/Cnf1wG/aAg==
X-Proofpoint-GUID: Qs76UYW858PdpTnqppTtT81D1wFhAS0i
X-Proofpoint-ORIG-GUID: Qs76UYW858PdpTnqppTtT81D1wFhAS0i
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_05,2026-06-15_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150253

On Mon, Jun 15, 2026 at 07:00:10PM +0200, Neil Armstrong wrote:
> Add the SPMI ADC channels on the PMK8550 SPMI5 ADC3 for the
> other PMICS on the system.
> 
> The thermal nodes are sorted by the sensor channel to be
> coherent with the system thermal nodes ordering.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---
>  arch/arm64/boot/dts/qcom/sm8550-hdk.dts | 279 ++++++++++++++++++++++++++++++++
>  1 file changed, 279 insertions(+)
> 
> +
> +	channel@747 {
> +		reg = <PM8550B_ADC5_GEN3_AMUX_THM4_USB_THERM_100K_PU(7)>;
> +		label = "pm8550b_usb_therm";
> +		qcom,ratiometric;
> +		qcom,hw-settle-time = <200>;
> +		qcom,pre-scaling = <1 1>;
> +		qcom,adc-tm;
> +	};
> +
> +	channel@749 {
> +		reg = <PM8550B_ADC5_GEN3_AMUX_THM6_GPIO10_100K_PU(7)>;
> +		label = "pm8550b_wls_therm";
> +		qcom,ratiometric;
> +		qcom,pre-scaling = <1 1>;
> +		qcom,adc-tm;

Does this need 

	qcom,hw-settle-time = <200>;

> +	};
> +};
> +
>  &pon_pwrkey {
>  	status = "okay";
>  };
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
