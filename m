Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747083;
	b=uO+STub5vvBpsn7Ttl+48k7NnYk94/YTDOOU2ANiTgZooQQmYyyaQ5nqFrRb6x/KfxnO
	 Szq9G9rb22KEl4983bvWPbwfLrBKgpJIW6wkadu9oIBsRxLWQzsP7GqJJMWoFY7v8YBXQ
	 mxkFnnkP+EWs1QNHwseLMp2OJ1JoSXRPCm23AZm9esKkafsolDShNLb8CPRShKQ+euWEp
	 j7tmHXd+HULlw+yxLSeL9MPAtmr9pbqV/T4U94OXqBZ8dQy9uJz9EOt0lk3ubAxmU224E
	 rDvyUQ1vgnqfjX1jFlTQRfcUmSxUjX6Mzr3lTkIfsMVoJu0jGV+nc39uZEsSlZ6avlQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747083;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=DkBtcEeyoOj9rnNnUDnU5HJQyBwrAv9r2nNM1OjD5c4=;
	b=fqAVz6kUT2rLErub7+BW84swgmmYVkHoypI9Of1p8TGHhmiaswVmVh1WUMoypNMyc0Gi
	 rzOowHc4obHf3XKgP+mysLF3253pJnUs6ms3/VAYinIDp8Ytu8VOQhd4AS9BDGtpuYshp
	 jrK6yHZMdqge8pUX1DhTo/ANYSNf1iVS4Mdaspo4lBbg87//wL5IQoyvyK28bkJBGdvqG
	 Eyzx8gDSfadSEeerSlw8sR8T5hu9wfJZ7FvMVHXi3BxyHIdh09pQJoXc0JrZB83iezAjS
	 85bllr99AxVrqw8dn2umABGBRADMWl3Ay1EIut7S/aT1+lB5Lh6edi9kCRxiu313p3g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gS3DtNMp;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CA95606A334
	for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 09:18:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CA95606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=gS3DtNMp
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a0286c981dso6684695e9.2
        for <devicetree@vger.kernel.org>; Fri, 23 Oct 2026 02:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1792747081; x=1793351881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DkBtcEeyoOj9rnNnUDnU5HJQyBwrAv9r2nNM1OjD5c4=;
        b=gS3DtNMpVSAhRKLz/tO31/qW1Tzg+CpzolIJbnfPCQqQhCPskhnR67AHmvHStKqN/R
         J8x0Wa+nSdPYcJ9V/6oKnZ2LB6Ccc52tI10KRfK/VZ8/CEuDy4VYK4KnnK/pJYt699C1
         Rx0GwdA8qfU/5PAy0ef+tOhp06JEsfDPt4NL4QQqJpDunFr/oYu6V5VxUZiGfaDygrQN
         PqzJSJK/IF5owlKtIVT1tWdvhO0uz6pzCk5wgQCn25M9s2v0AdnRrK3MskJmF2bccnXK
         +MJD7m3z+bUHECxczgtCxes5DQOElAt1OsoqfjXiptxebUrBZytcmUC5rzfcl/TBSQJU
         GTZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792747081; x=1793351881;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DkBtcEeyoOj9rnNnUDnU5HJQyBwrAv9r2nNM1OjD5c4=;
        b=uct3vlQJdYFkNKs+ELRweLdRanVllWyYuDml4OF7N/MyiCgeyEJAJ7f6pDzG3T9KqJ
         iK7FtBzXIQ+vcv90GCcInfks711TsjEV1AtoAGvjlCpJoFQPpKtC8WzMs8QLjOyz0Rgf
         EjcBmAMpxDZCATNDcM69cQZvqAXFSBrju+1z+kWMMsN6/2zT0q6SHTrnKhbFMlJ8VBv1
         wiRlg5CC+/ovDWvCuqkB+A60aUltbZ417FrdbUSRrsEewI/WnlVr6oNJlilez3iFim2s
         Rp7xiL3dp/HpiJ3hRAV5/seNtVxWyclMceMMaCBuEgMVdXNv8XAA8COe30e9m1gk+k63
         KsSg==
X-Forwarded-Encrypted: i=1; AKwUvByawZ05WU7434KK4CiY7Hb5DXKS29NMoU14qkJteTYm8UqlEs5QBUuYwPo1188qWemtixsysXPITYsf@vger.kernel.org
X-Gm-Message-State: AFq9FYIh97Rnf11sZBGbB0RSykxw7z+aoDtcpPtHjH5UdaUwDjVaWHwI
	Yc85Edvkc7Vg5973SSNzM7As9Q21lthPgYiqwOVjECa9Fd/XqsYAB9r0CtBIZ2WuWjQ=
X-Gm-Gg: AYBFou1uPOAFYT5U0ca4RNPO7N3eVyHH1fAaEPN13hVOyezvJ2ZRljOfa8Xq7YwIOwN
	INdMpizCjAP3/FzhH9ouPYjZKaUAKPDGGeCsH+T3j3LqhP+BY+zj5XX1uK/qSSbowzuVuLyjEVh
	6yvzCoMDWbtnRsiL9MbJDBMKcFvq/IzIA163TG5MnmW9jR1F3bvAPKCidnNrnWAF1jTHIV6euOb
	N0qQts9pFuf5WxjIG4qbpcPmNuHM7TYAPKMlz6y0tWc54tWpY36ZNzMpUImkXYO7+EkoWkT3sYW
	0sTMqHp3lD5rGlw1UIMNYM4766+Ls4KYQ5rzWd1ZCaVq9/vMrbq2WvPb7Dt6O3qPA48n0tK9Kh4
	A5fIpCOJXzFHVzU7hQJbU+sLlWOd4Nfubqqur+U13mj+xpxho0krHfDDH4sGpkYtZ50yph6g8MH
	caT3hecQVmsNG0hkRhXYjVsODaCxkRaQgpfgS0REJ3DJFbwux1FVKE590d9rZkYa+7sIbBlmxsL
	75TxopLA42gymqY2BBovkawncHcXUoDt52zoCkJIOIyFAxb8XL6ZaKuXCNTOGJjlMY=
X-Received: by 2002:a05:600d:84ca:10b0:4a2:150f:1610 with SMTP id 5b1f17b1804b1-4a2150f1826mr12043165e9.23.1792747080587;
        Fri, 23 Oct 2026 02:18:00 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff25:4f10:a88e:f1a2:fd42:7693])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a2104627e0sm60827045e9.9.2026.10.23.02.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 02:18:00 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:17:54 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, johannes.goede@oss.qualcomm.com,
	conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v4] arm64: dts: qcom: x1e78100-thinkpad-t14s: Add thermal
 zones for PMICs
Message-ID: <atsmQqSOuqp1LKw8@linaro.org>
References: <20261023083827.7648-1-daniel.lezcano@oss.qualcomm.com>
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
In-Reply-To: <20261023083827.7648-1-daniel.lezcano@oss.qualcomm.com>

On Fri, Oct 23, 2026 at 10:38:27AM +0200, Daniel Lezcano wrote:
> The ThinkPad T14s needs thermal mitigation under sustained workloads to
> limit temperature rise before thermal shutdown. EC interrupt-driven thermal
> monitoring is not yet supported, so use the board temperature sensors
> exposed through the PMK8550 VADC to provide mitigation now.
> 
> Describe the sensors near DRAM, the fan/heatpipe, the GPU and CPU PMICs,
> the charger, the WWAN area and the USB-C ports. The DRAM-area sensor faces
> the keyboard, while the fan/heatpipe-area sensor faces the back cover.
> These are internal board measurements rather than direct measurements of
> the user-contact surfaces.
> 
> Use the heatpipe-area sensor for passive mitigation at 57.85 degrees
> Celsius, derived from observed platform behaviour with the Windows
> balanced power profile. Map the passive trip to all CPUs and the GPU,
> with 1 degree Celsius hysteresis and a 500 ms passive polling interval.
> Name the trip "backcover-ec-alert" so that the planned EC support can
> locate and adjust it.
> 
> An earlier approach using staged CPU-cluster throttling did not show a
> significant improvement and introduced a latency imbalance between CPU
> clusters. Keep a single passive trip to provide timely mitigation.
> 
> Add 73 degree Celsius critical shutdown trips for the DRAM-area and
> heatpipe-area sensors. Retain these baseline thresholds pending
> sensor-specific hardware validation. The reported Windows DRAM threshold
> of 115 degrees Celsius has not been established to apply to these VADC
> measurements and does not justify changing the shutdown thresholds.
> 
> Thermal camera measurements indicate that the readings primarily reflect
> internal temperatures rather than chassis surface temperatures. No unsafe
> external surface temperature was observed during those tests, but they do
> not establish qualified critical limits for the internal sensors.
> 
> Expose the remaining sensors as monitoring-only zones and enable ADC
> threshold monitoring on the corresponding PMK8550 VADC channels.
> 
> Reviewed-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
> Link: https://patch.msgid.link/20261014193524.5590-1-daniel.lezcano@oss.qualcomm.com
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> index 75ad74bcb042..21f4569068e1 100644
> --- a/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> +++ b/arch/arm64/boot/dts/qcom/x1e78100-lenovo-thinkpad-t14s.dtsi
> @@ -502,6 +502,88 @@ platform {
>  			};
>  		};
>  	};
> +
> +	thermal-zones {
> +		/* Sensor near DRAM, facing the keyboard. */
> +		dram-thermal {
> +			critical-action = "shutdown";
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_THM_100K_PU(1)>;
> +
> +			trips {
> +				dram-critical {
> +					temperature = <73000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +		};
> +
> +		/* Sensor near the GPU PMICs. */
> +		gpu-pmic-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX4_THM_100K_PU(1)>;
> +		};
> +
> +		/* Sensor near the fan/heatpipe, facing the back cover. */
> +		heatpipe-thermal {
> +			critical-action = "shutdown";
> +			polling-delay-passive = <500>;
> +
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_GPIO_100K_PU(1)>;
> +
> +			trips {
> +				backcover_ec_alert: backcover-ec-alert {
> +					temperature = <57850>;
> +					hysteresis = <1000>;
> +					type = "passive";
> +				};
> +
> +				heatpipe-critical {
> +					temperature = <73000>;
> +					hysteresis = <1000>;
> +					type = "critical";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&backcover_ec_alert>;
> +					cooling-device = <&cpu0 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu1 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu2 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu3 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu4 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu5 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu6 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu7 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu8 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu9 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu10 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&cpu11 THERMAL_NO_LIMIT THERMAL_NO_LIMIT>,
> +							 <&gpu THERMAL_NO_LIMIT THERMAL_NO_LIMIT>;
> +				};
> +			};
> +		};
> +
> +		/* Sensor in the WWAN area. */
> +		wwan-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX3_THM_100K_PU(1)>;
> +		};
> +
> +		/* Sensor in the charger area. */
> +		charger-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX2_THM_100K_PU(1)>;
> +		};
> +
> +		/* Sensor near the CPU PMICs. */
> +		cpu-pmic-thermal {

I'm a bit confused by the node order here. It's not ordered by the
thermal sensor (SYS_THERMx) like in x1e80100-crd.dts, but it's not
ordered alphabetically either. Or is it still the old order from the
previous revision?

I think I'd personally prefer ordering by SYS_THERMx, but alphabetical
order would be our typical rule.

> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX1_GPIO_100K_PU(1)>;
> +		};
> +
> +		/* Sensor near the USB-C ports. */
> +		typec-thermal {
> +			thermal-sensors = <&pmk8550_vadc ADC5_GEN3_AMUX5_THM_100K_PU(1)>;
> +		};
> +	};
>  };

Anyway, for the changes itself:

Reviewed-by: Stephan Gerhold <stephan.gerhold@linaro.org>

Thanks for fixing the names!
Stephan
