Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793449232;
	b=duLZlprBFI8I08iP3hGio/2esrCQbTfX1OZNIgH/CFb7GQ5RAiN9qMVLLW69nAjg4O4X
	 Uym5JVindrIqKs+eo6AfSCtja16EWhj3RIlTREbiB4gTvwVCMkLZ6ZkRZ3SivIescPaJn
	 /W5JszTUynEGyKj9BXGdCv2kd0AqfAJHXXq/kjZmTfKwSNO984QOtJ/3WAh/XSC26ter0
	 psAbwvvN5ocUWRYBuH9VSexQp6vLqXCDxE5T4Gz7sgBV/v6q0B7b2p0cRLk7OYnD+zE1u
	 a9022Tq/6zb50nIcEMKaG8RCBFo5CuzSeF3BlsexZUARZln97n3wso5q8RJJ9A75OlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793449232;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=O6eml6/KMAyx4GGG3XewIb3LC5ArF6kRUP9Bc5QWjbI=;
	b=VPylyDVGlVsFXx2gypKuCcbLMx7n8eLQj1W1CJak888HTTQj8ibM0eLhylfQrW1GPIWd
	 QHaPnU4gciXQfWaAsU+StzFcpxRt6jEjprEPLHvunTy71psdyo9gwO5upvkSclKPPduQY
	 9pvGeo6qvuHFYDpaCJOFtDV/nFTOEwgCS2kmeJncZ6tVaFLSyeSTKlglXgnn1K6GNxeVs
	 j5iqQ6k/Cp5RmKSyWDPOuftZn0pii3zVXMGTKYVSMIf6GJ8+yn1IozrCvibzoC2KPFOmG
	 cpBflzbvxqd/3Sayaloa4R2Vz4rIVf4Qlnp7RfDTW7eKD4xh7q8LJuDI8m/JaydhIVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KgZdjNhW;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LGaL3DeU;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF55606A31D
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 12:20:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DBF55606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=KgZdjNhW;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LGaL3DeU
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69V4leBq226629
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 12:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=O6eml6/KMAyx4GGG3XewIb3L
	C5ArF6kRUP9Bc5QWjbI=; b=KgZdjNhWbZo4YRTv4iA6OSTSK+Hl7xydAMw1sU7z
	r3D5AjRQczY2dV8AD/cp4PGNTlxdYPZ5HGs7qpM6olkd5XV/jHU1hKNUZnjFGfLC
	Au1kRb2U6a+drRG0dM22vuLHXzXzsG24b2dTTv0LkIYOLdbqhaST/09XG616fklb
	KhmqQANvVixgRhkiAt4+T3pSogQTTLAw9MMBlrkJAjs7+pF1rINmQLebnn+j9tZZ
	Oa/+qlka5BBoGxexI3VZ6QogFMb3na67VK1pVq3U/pFfay2qZ0OwkJdYeO2g6Uq4
	qfHaSiuSHlCjeSWt/qOpfRL86JbzCSrrpGHW4CPEqC6jqg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn9m98vnb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 12:20:29 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-36a3451ea93so2540521eec.1
        for <devicetree@vger.kernel.org>; Sat, 31 Oct 2026 05:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793449224; x=1794054024; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O6eml6/KMAyx4GGG3XewIb3LC5ArF6kRUP9Bc5QWjbI=;
        b=LGaL3DeUj5yf2AAtf3+90TY0kCwS7+KrYE7NklMXjTD/LlKB80jUrVguJrPsguI9Q0
         FhEHpR1p8umrXvjxnxByXP9BoeW085fTslBvHvIvM6yKYvAcMvF4Q9Tj6tVwIxpX9WWH
         kELin8/epCLyK4ECOk2dI28R9Negg6x6GCTZpARNHztppqaeZ9Xt4RCWQauvf21m66rK
         rBC+WxE5J3Q4Hoq4At+aAxo8VwemyNBPeJiUl8VtbUwXF3eR9g6g7bpiddcUVyyzDM3n
         kSyOSXgMxqGgI21MntRCXFdUT+PHlY5+i+hygFvLncBWYo7ehXKp2uASf2oPc2VFRURD
         biaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793449224; x=1794054024;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O6eml6/KMAyx4GGG3XewIb3LC5ArF6kRUP9Bc5QWjbI=;
        b=cg0oeGyyrNdd38wcZta4AgXNhcOfyUZLtnmQUTg3MbcgBfKjIk/HjyG0NRSih3tAnw
         5H1vDUgAghz/zomvN/RuPJ8h1MjhpMpOe1GuiLKhtVk6q8qrO53nrOkOidrhAMoOZs/5
         0Lbo6jr4O/uoFc1YHmJV50yaMKxvYxyNQRuGhLm3xJToKtUsjdEK5/9aJ4fRDA2AjGf/
         aU64r1p9cg4WfGG4pk/DqEI7oiOOCHrC9tYpNkld5WMezwUPpWcqJDlhXnWnuRAtnRgM
         BSBe1RVB5Sf5kYRJ1iUfKcR8KbREfz0tjee1VDeyU68d05wX8NIbFH2BcWzQcjRy4ioR
         7LMg==
X-Forwarded-Encrypted: i=1; AKwUvByUzBkxWiUEfWexwDYWk2xNEe6YZ6JS/eYQFjDecr/4qkiovW9JPGNorsxbeGCoW0yqD9pih6E6nCDF@vger.kernel.org
X-Gm-Message-State: AFq9FYKCoNgIV9zJFKTe0taw3ZmwUqLMwC2zxDlhDWs+xEghYc4dcHuo
	P4D/xrn2iZQ3OoCsD8h2kxDIkhQEtW90WRcDzG3aItOzYhiP2VBGTSf6fv3lgRw8veYWIHURJSu
	TKk50ZJkQo+hpJt4HIycSxhLdr2dxAU5G4YZwNIYDFn29Gf/ssHeHIHjwSI6pD9Gj
X-Gm-Gg: AYBFou3CDa7nN4ez5eL9sdUMvVcdHjRcS4VwkpO2aftAbSQlRpBLyyPXjq56AkoompD
	lcN4LNjElKQ3ev0IQVoYDSBuVYStqAwyCEITA2lTBarWKeeYXKPVBZXzl/QNchFJ78nrOfbcHxK
	pmY4rx74KTKsb+AcaCS2EJUoD3uN9tBHvB+lD/GksOXFtC1WDEttvddygUvfcBlu+ZTBDJQ43wP
	NcY8ocldn2bIa++QqE630YVaXS+mPv6BIhf+kXPDJxIF6H3gbYJyzqi6+p3FviCVgH2WHBcZSDe
	//A2NfiHhkjC/CYFCK4vf6oAti3BCUkiLn4Y599T5NpnbiOoDQPuGpffZH6QceZXmnGMg0Oi2of
	DUyh1UahZVdLMEu+h+yZZSW82rL8eSz/QXuSB5IDzVCLfLer2mFcgUgkdko3pbrJowqlGrkP6fr
	cgGeNx+qnN0n214UA=
X-Received: by 2002:a05:693c:638f:20b0:36a:15ee:c209 with SMTP id 5a478bee46e88-36a423ec1fbmr7213927eec.23.1793449224127;
        Sat, 31 Oct 2026 05:20:24 -0700 (PDT)
X-Received: by 2002:a05:693c:638f:20b0:36a:15ee:c209 with SMTP id 5a478bee46e88-36a423ec1fbmr7213863eec.23.1793449223250;
        Sat, 31 Oct 2026 05:20:23 -0700 (PDT)
Received: from QCOM-aGQu4IUr3Y (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm18933983eec.15.2026.10.31.05.20.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 05:20:22 -0700 (PDT)
Date: Sat, 31 Oct 2026 20:20:16 +0800
From: Shawn Guo <shengchao.guo@oss.qualcomm.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Nikunj Kela <quic_nkela@quicinc.com>,
        Shazad Hussain <shazad.hussain@oss.qualcomm.com>,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: Re: [PATCH v2 7/7] arm64: dts: qcom: lemans: Enable
 lemans-sa8255p-ride board support
Message-ID: <auXdADNJMS2mMsuh@QCOM-aGQu4IUr3Y>
References: <20261015023711.721837-1-shengchao.guo@oss.qualcomm.com>
 <20261015023711.721837-8-shengchao.guo@oss.qualcomm.com>
 <45b54ff8-a2a6-4eaf-9d5b-cfd9bb40c459@oss.qualcomm.com>
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
In-Reply-To: <45b54ff8-a2a6-4eaf-9d5b-cfd9bb40c459@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: YiHuVKjKpry66UCXmOs1SVmPFEvzdT3f
X-Proofpoint-GUID: YiHuVKjKpry66UCXmOs1SVmPFEvzdT3f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMxMDA0OSBTYWx0ZWRfX4gFPD6r83RmS
 qsCp881tSQ3LYxjJjcoIBBHoI4mT6zu3qsrEKIrrKshaL2eSDwA1RdRT8plRix+1NArt63Aty9s
 zz7+I2wxMbKhSfM4Ux2x3PO80evlUFPgNkJpc+6EoCDjV29Z2wbPKYzDkut2yhcwG5uIcA71fTB
 cghVHZjAlhMhOXfOUEsOGxCf1rP5kng2NfOkp3WQBHXyCdylYFt27P1F217uNqSscqz2bX4qPMm
 31IB3ZVp3ae26E7OOqf1d45igluebqrkkliUQTR4hDHc23eYSJMG/dx5oSSooJIpA7GvkPE+85e
 6UExfiuYEbGBeeE2qjVrTcZrEuNBTdaom02qyTO1YfX/FdROm0BW58R448wy7u5Ga5iq97KST6n
 t7BLIF3pjYYWfosI2mg3//ORfkYmrZlL+FNN1gkalHPrLid/y+RJMPcTDy7x5CGRdrNmRp3iTGL
 GnSl8iFRatKr/egsUbQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMxMDA0OSBTYWx0ZWRfX/k5tgOMAuOQ0
 j0JwOGtKeHahIWFn4gjCrO4t23D6JOHTgm8mkHBMFs1CKHJ10uaqg/+PEJyY6GVp1WUVh1MbzSs
 REB0pATiF6kC21vy3sB6bmKCGa9MgmE=
X-Authority-Analysis: v=2.4 cv=cfVHPXDM c=1 sm=1 tr=0 ts=6ae5dd0d cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=kj9zAlcOel0A:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=7v2nZd0nDHYtio1KbugA:9 a=CjuIK1q_8ugA:10
 a=bBxd6f-gb0O0v-kibOvt:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-31_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2610310049

On Tue, Oct 20, 2026 at 02:16:27PM +0200, Konrad Dybcio wrote:
> On 10/15/26 4:37 AM, Shawn Guo wrote:
> > From: Nikunj Kela <quic_nkela@quicinc.com>
> > 
> > Add initial device tree support for the Lemans SA8255P Ride board. Enable
> > UFS storage, UART10 as the serial console, PCIe EP interfaces, thermal
> > zones for PMM8654AU sensors, and SCMI protocol nodes.
> > 
> > Co-developed-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> > Signed-off-by: Shazad Hussain <shazad.hussain@oss.qualcomm.com>
> > Signed-off-by: Nikunj Kela <quic_nkela@quicinc.com>
> > Co-developed-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Signed-off-by: Deepti Jaggi <deepti.jaggi@oss.qualcomm.com>
> > Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > Signed-off-by: Shawn Guo <shengchao.guo@oss.qualcomm.com>
> > ---
> 
> [...]
> 
> > +	thermal-zones {
> > +		pmm8654au_0_thermal: pm8255-0-thermal {
> > +			polling-delay-passive = <100>;
> 
> Do we need the polling, is there no interrupt?

Yes, we need polling. The sensors are exposed via the SCMI sensor
protocol, and the SCMI server on SA8255P doesn't seem to support trip
points. Also on the kernel side, scmi-hwmon driver implements only
.get_temp for the thermal zone and doesn't handle trip-point events
either. So polling is the only way to evaluate the trips.

> 
> [...]
> 
> 
> > +&pcie0_ep {
> > +	pinctrl-names = "default";
> > +	pinctrl-0 = <&pcie0_ep_clkreq_default &pcie0_ep_perst_default
> > +		    &pcie0_ep_wake_default>;
> > +	reset-gpios = <&tlmm 2 GPIO_ACTIVE_LOW>;
> > +	wake-gpios = <&tlmm 0 GPIO_ACTIVE_HIGH>;
> 
> This GPIO reference feels like a layering violation - the previous
> commit promised TLMM is abstracted away

I will reword commit message of patch 5 to clarify that kernel-controlled
TLMM GPIOs are not abstracted by firmware.

Shawn
