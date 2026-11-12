Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794477545;
	b=o1QhQfyspu5tlFYTF/ETljNKc6iWiScikGzKSzaqqIyR0Pi1bIxaTkWg+031K6SfCREr
	 A/ZBljAG89eheOt26l6olODYQsuxGWu6ysoW9aWX/ixR22bVfFsRG9l8/81jehC0xQGu5
	 0CXhg8PMknNT0gX8tSfPIYbxF0c/BTYNpBlqISSCkwN5pkI5cFMP6metOjHi3lN3cBuLd
	 ljHLmid2rwghoF9lsXKdeOcOudD6DmnNc2nVMpMHTehWN4/Q4LBiMldJW6qEfFX1EP87c
	 KPx08dv0wTDkBwQ8tHO/xXpA5o7u7K6rT86uSTrKejlpsbxV6Gx56D3EiXW4VQyDh9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794477545;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=r0hPGyuQen3K9sOCoAqm9qBxwEBCNWNkbCx/2fholUI=;
	b=e650AO1ZLx+IjGbPEKErEeob0VIb/hlEZ8O5Dz8lTYczZMn9Pn5c69ceaEzF/YpQCZDn
	 p5DMOJGmnpxJ8c8T+e6PtqrJ96wuhox/xyNZHWuJkv1dkbIyVzb7EvnvgrfHjQIdCASQg
	 F1ALGn2jr8r1ilazqMGq09AiwDzmdWU8BNxgv7RJJkBL9iRH9JPEdIrBIdV2Fl/kdc6cS
	 Zd7pCbS9j2W+qShgSN9XeoMQxt573ASum8rYYfvojsorjJ2cubBj8PPDfnkyQXtJFBAnb
	 9LbFnQfM1SCbF9qO62dlnRi+OKbXL8BRaAbY0iHjFm6lssbeUko4oB3WIXVB2f4aovg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I95SfLA+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHhdD1dM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5652606A32D
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:59:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C5652606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=I95SfLA+;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WHhdD1dM
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9CEQp2514242
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=r0hPGyuQen3K9sOCoAqm9qBx
	wEBCNWNkbCx/2fholUI=; b=I95SfLA+ouoj4f4NQTIBZSOkdF+huRxmBi27OgZi
	jeJjoibRCCnU3LqEVGnY4JPLquWWoJ6liFWwOJfFeV/qrKWaiJfpPZuCwRPDx+iQ
	xL2Ly2tkMgdyueBatLgXbslHLNyfpTkBTeRKA/fcE+9Sa+v+V9w6WLdm9AOSOcPN
	2PYT3gMEWTiNQe6Fo3PcV8cCSjd8yPdgemglgJyhCe6/xCseOTsVRxbxanQxQkd0
	vhqrUP0Ij+xC93OMxOrH4aWI5VKQK7ME2SF5ImkHmtRapTmy4gXQffoJFGMDJsri
	zflxaMvqJ+4WLhIdE47C5tonJXWO961wSUB8WNLAB7IGbw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1u1qc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 09:59:03 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e92aad34aso953491085a.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 01:59:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794477543; x=1795082343; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=r0hPGyuQen3K9sOCoAqm9qBxwEBCNWNkbCx/2fholUI=;
        b=WHhdD1dMuk/pmrCBKGBjfJxh7dfqH0jHWDoBCWvd0cNXD74lwY6W8gDSiBVFGwbn+G
         U7+F1k3HN82vx6uqgG2wn9niuR6Q4Wj9Qye1+RujOg9j3x8FQHyl8lSIsRabPATxGYeO
         dXcdtKLc7bCuVeSKb/IKJuDnd2fT6GMY8xWqPjEGSPoUHDSZ4fmlvLvs+qP1aHuQ5HRD
         cKyU01qilJFpIv2CFmkRC4Vq9vjMEl+VLb/X6UeKwZHRuhquCtgBBc/Wf0k8ddCUb3J5
         GVj0zZ4d3CFfLsluG0Z4ccXa5tQw/dgbDuV1B707BBByBTBKdabpF8/NdGFB08kbbCwA
         3hHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794477543; x=1795082343;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r0hPGyuQen3K9sOCoAqm9qBxwEBCNWNkbCx/2fholUI=;
        b=rjok5jPeHP3pSv/oPxSybnxeb7QPM5FrQiSYhuQq4vSW8/1OpincAMi1exmokExQ7M
         13UGeLZMiwtTPuH5l3qV0G+/TvfaiIuYFq8vK4ZVyI3R5gwsqjecHmIqvSvf3GFeb4tu
         b6LkBwj5V7WdmyTXnXH4mwEKP7Cf4lYH4BUViWR9ofH7eWZPKv3UPhA2YrES741rzH1s
         Td/f/n5Re7Ty0wg7YjueqXisjiVdz1Q/II+0tRjzmy9mp6vIn8puHOIYt5yOzjSpK7Sz
         yjkYFl+aPqSbciVO7nQGvqOtiCenJdXjtlO/BtgU4mf7ZAVLeMn83/FnTb/kIYknhcUz
         z+rg==
X-Forwarded-Encrypted: i=1; AL+hErGEKbj1gTLRkin5DHYQSw8m5+7u6EPUOYAyeEuv0Jl/l/+0Q3BSqSh9+tnTiwaoMXt+jBL4eYiH0Fol@vger.kernel.org
X-Gm-Message-State: APuU4Z9bpvPgFNFgg0CFSjy0ZTHuCR3m/KNrmhHk1x9/rvm3ed5hxWUd
	VFQRpziTD+PfynJW9MEC059DtbGhiYJN/tiI+g3fOjOwxZh7eJB3eJH6N2I4i43dYipWianqPS/
	gVxErbJvvKO4KfMIzcvbiK0DAaDnct2SivKhtAYsZcGwfcqzGZaWU2eFqEiRS8L88
X-Gm-Gg: AYBFou1ymDdqL37LUsDe0ekgH8ti3uH5cEw3Do6JanZ19NYSlfk+ZcijNwjfL1dvb94
	mXFtKzjq/n2txo/qcBYEQTrmtljHKMAk9iaPPker8+KEa65l1DxyY6FL0rZeYz018JAlzaglKXo
	HRrvytYdI5SCnuA210sy8mqGZbOzNy2chJ08Y0U4yl4RM6GAwhNF4tuc202X0wFj6O8rxiVf0g6
	NPWOn183x3YYphzqHd5SPqDI2ZqbbgpSD9x7V1LBMi/VmU45h9kjqrxYZ1RyYPECkvmh7TdOX/m
	J1gN5TW+FQG9G+LGKIq9zWnnOZRv7v1p+Qi28yoYJ72kT+TWH/JRNFcow6qicV9fjcIGYuuyI7L
	jT16LdHRzfF0jUFY2G7xju+vunl2lCbDyVEjhLcZiVyaK/oFGktST8KAamHT1wl8S
X-Received: by 2002:a05:620a:450f:b0:93f:22f4:f0cb with SMTP id af79cd13be357-947b0013ec5mr912340485a.43.1794477542700;
        Thu, 12 Nov 2026 01:59:02 -0800 (PST)
X-Received: by 2002:a05:620a:450f:b0:93f:22f4:f0cb with SMTP id af79cd13be357-947b0013ec5mr912337785a.43.1794477542098;
        Thu, 12 Nov 2026 01:59:02 -0800 (PST)
Received: from oss.qualcomm.com ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498365cbfc6sm16883720f8f.41.2026.11.12.01.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 01:59:01 -0800 (PST)
Date: Thu, 12 Nov 2026 11:58:59 +0200
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
To: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mahadevan P <mahadevan.p@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: qcom: eliza-mtp: Add WCD9390 USB-SS mux for
 DP alt mode
Message-ID: <u4un5w6cckt5wnc6exjauzulz6x7ujwjihtpo7g3mmalobs5s4@c4rqrnce5agz>
References: <20261112-eliza-wcd-mux-fix-v1-1-70c521781ac1@oss.qualcomm.com>
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
In-Reply-To: <20261112-eliza-wcd-mux-fix-v1-1-70c521781ac1@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af58de7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=fvgkK2lf_SR_Mrl50ZIA:9 a=CjuIK1q_8ugA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: 6M8AENXNw2BdOhUAY9lIIEjCKpQvvKaC
X-Proofpoint-ORIG-GUID: 6M8AENXNw2BdOhUAY9lIIEjCKpQvvKaC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDAzOSBTYWx0ZWRfX8DTpIHTKetLI
 BzFaD2cD85SgpRVNzav7iLckss9CiHBYzDbpmPvlZypNfKpsGxIpU7NeNAuLOp6mtG2sSsdKYys
 Oi6Zaot9Y+4/NrUyghyS0mAqACcw4pqhAjT/fGgV9B6PyxDQBEBoDfV6nKoHwrtsmgI/ygn+Hkl
 lH+uFSLbyUnbpQtASvFFhr7LYFAQlXC/dMCvMaulzAlAzhHH6T3LT2BGzK+430X8reIXYG5/tDH
 SYwlztiFwIMbSWr4cskm7DCBKpV6nAcGHOxM2FVIZmWjgvaQ2BC1pLT8Cbsa4yIpdQQRlHhZTyy
 SXkRD0ucLxInKEENi9ApW8XJsRqThXAx78FRbzHrJglpwmW4bmtwn4h7PEASh5zibcuDx8tZaIn
 bZauOJ3705WR1oXf2R14oVypyPvfcMiIPj0JjmUCUP5yRXsTaq/OIuI6ib4Zt7RfYmEsu/GASnL
 FZQ8QfudjQqkhCIeLfw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDAzOSBTYWx0ZWRfX2u29jrgsTGNg
 X6oEeZpxbjELy4/RSQmw/Q7dQb6gP092u+QDzA61btAChSoikqpZw9asAF8t2VMbnCA+gwp6Lm/
 FnCVkLqK8cqWZEPoe6BaWCMUGKbH0/Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120039

On 26-11-12 11:03:43, Balaji Kalkonda wrote:
> The WCD9390 USB-SS mux routes the AUX/SBU lines between the USB-C
> connector and the DP PHY, but eliza-mtp lacks the devicetree node for
> it. Without a physical path for AUX, every DPCD probe times out and
> the display never comes up:
> 
>   msm_dpu ae01000.display-controller: [drm:drm_dp_dpcd_probe [drm_display_helper]] dpu_dp_aux: 0x00102 AUX -> (ret=-110)
>   msm_dpu ae01000.display-controller: [drm:msm_dp_bridge_hpd_notify [msm]] type=10 link hpd_link_status=0x0, status=2
>   [drm:msm_dp_bridge_detect [msm]] failed to read caps
>   [drm:msm_dp_bridge_detect [msm]] aux not connected
> 
> Add the wcd_usbss typec-mux node on i2c3, along with its supply and
> reset line, and wire its SBU endpoint to a new port on the pmic-glink
> connector. This gives the AUX/SBU signals a physical path from the
> USB-C connector through the mux to the DP PHY.
> 
> Signed-off-by: Balaji Kalkonda <balaji.kalkonda@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/eliza-mtp.dts | 36 ++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/eliza-mtp.dts b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> index ee05192adcfb..d848ae77ab85 100644
> --- a/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/eliza-mtp.dts
> @@ -96,6 +96,14 @@ pmic_glink_ss_in: endpoint {
>  						remote-endpoint = <&usb_dp_qmpphy_out>;
>  					};
>  				};
> +
> +				port@2 {
> +					reg = <2>;
> +
> +					pmic_glink_sbu: endpoint {
> +						remote-endpoint = <&wcd_usbss_sbu_mux>;
> +					};
> +				};
>  			};
>  		};
>  	};
> @@ -112,6 +120,34 @@ vph_pwr: regulator-vph-pwr {
>  	};
>  };
>  
> +&i2c3 {
> +	status = "okay";
> +
> +	wcd_usbss: typec-mux@e {
> +		compatible = "qcom,wcd9390-usbss";
> +		reg = <0xe>;
> +
> +		vdd-supply = <&vreg_l7b>;
> +		reset-gpios = <&tlmm 152 GPIO_ACTIVE_HIGH>;
> +
> +		mode-switch;
> +		orientation-switch;
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +
> +				wcd_usbss_sbu_mux: endpoint {
> +					remote-endpoint = <&pmic_glink_sbu>;
> +				};
> +			};
> +		};
> +	};
> +};
> +

Keep alphabetically sorted.

>  &apps_rsc {
>  	regulators-0 {
>  		compatible = "qcom,pm7550-rpmh-regulators";
> 

With above fixed:

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
