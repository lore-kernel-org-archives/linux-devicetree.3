Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822113ED5C3
	for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 11:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785496856; cv=none; b=K6LuaF9EXR4l1GeSVY1NkF0ToJc1WHRHafv2y2/NlVGL23u7bk0udkhlhYlBljSFsa4RXxXZYk3w7E5bYPaV8tS8c2G5TcWfphC6zm3QFtWtb0eRgAk3yDHPqfgXeSUDLf5YHc8PNoe6Nir1IZjb8VVE/e4Ca5o48o/eEvOoVZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785496856; c=relaxed/simple;
	bh=bhq3MzeqOsauBzIWfBC+LweuxxY/XXQ4w63ZT64jvPM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Bs+G+xY3nOLN+Js+6cFgoZEpW3cxQBYL4Tt34ildIcuB5h9wzLQHZ6WhPoiqdsdh+/0l+BwN948Jzd0hJGmVLFI9m54DxDNK/REsObBCMWa14pEIIvYloSvI7CvmRx7RTzoChCJisc7hI7RkE/nrbJk+v9QHziAs7Vw/pvin1EM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dmVncrkE; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dmVncrkE"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-c15f47e6297so89372166b.0
        for <devicetree@vger.kernel.org>; Fri, 31 Jul 2026 04:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1785496853; x=1786101653; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bzkNS7AH3AQpIYPHQeQ9hpg4r1cVjOJtrFQ4q2xajzU=;
        b=dmVncrkEQMeZ3LCEtrYL7CKtvI9z3zNHGLiZrU4uVjApYP+2LAbk6nesi/bE8VH9Ku
         Pdz+s/ZWQKVRlwGNRKxLlmHqvoId39fwxRp+ju/k9w0tkNvwwKw/7k2dsvnFByGknyb5
         6ZSHtJkGMFJsfKI2lJLXqGC/ewN7t/2+vW1qB3/JLlnXq2MUQQZLbipQGZNVs1HmSTre
         s6GdXVTtawgh+wv3dZMEad0Q5zl5IYOmgRGOFFKo6XHOIeOApbMioQ8axdw3b+VDGGSG
         nxVqUhpg+LqSTbjjrNFu3XUItIdvf0jz5CNbQ/h6l+UoGwQTlAZFnr9umE3F/oaF+Yhs
         sseA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785496853; x=1786101653;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=bzkNS7AH3AQpIYPHQeQ9hpg4r1cVjOJtrFQ4q2xajzU=;
        b=hL3H0WqFYm+XdNJ+Rwnk7BzrhkVkPQpqRqPSlk1vuq+whV+InjEFenbrHp+SrVILE+
         CxdqgbYHAejvzpHrbygdEvYEZpHJvyXICkTbxW7DS8ACaIP+Wa185kRJFBNtWX9Ei2AA
         8mTd5KTmzSXE8wT4tUMxJWvnERZqCkaZr0eLT9mMeRbmsJM4qVqC2Ej2mDu3UXIENJwp
         aK37k+1PDqs5VtY/FVcC1zmVzOoL0uKTyut7gyE23Z8UAxSITpsGN7EIvLf6Jxl/dbtq
         q22U2OCzfm5poghQLb/2dIYAF/R2egk8bhgOmNU2nrLNclWuGLd8gwEoJ2WzRaQE58rF
         VEWA==
X-Forwarded-Encrypted: i=1; AHgh+RrkMVZ99F2zZkr3q9ltASPmKBpeyvjtf9fWy76/xR19mONchfK1MDgbyTxaelwX7aX6vhV8sfGecEPl@vger.kernel.org
X-Gm-Message-State: AOJu0YzbW+GKaikO/IoKDijdisD+YePOwgBWq247VgQUuNRg7o7BKSHI
	doaS+YkSNbNQg5lX8oELArxH7x2jwLUvV0sUEAq2K6+ICCgfuDFwjRxP/2jiagBR9QM=
X-Gm-Gg: AR+sD12WT/Hv8H5aYV8lGi8SH32AZK/4FJxiW/1cJBn7HW1L84h1QCO/g4p6CWmJl1n
	85N9B1vkR6sfFlPgAMhM/ADEuI6lIi85AiRIrPUrJcYiJzPAOYPflg6e+yVuw3FPzJC2jKQaMbx
	DLs2fuIWpKQIE3RB3PnnQz0ihhWRv/Nl/qYq2u/cs4tIkKii6sHX1Fg8wV+S88iAHbFr7PzZscS
	Eu6bM9zLFcBONqo4ZjYchU9nNBiXKAXdCc901ZKmI/W38H9V/PbKb1FrwXsSCTbaek/iIYGPsf9
	L/H60z6sBYsXQzqUWb179v+f3EwGo5MW/PXAeZWjvpgCrwgsH+2D0piDF8qUOs8v0/O3/ukt+FW
	dJnrvslgruQv8FClBzTJbxo3EEEGP9XcFi/x6s7xcT0+F3pJOOr5TI6gCv/gtCahi+JniN74taU
	Shzb1THT0a2RCVFMFEfoHL7/R7fCxOdcLLE9HtWBJbpbLY1czt+y9kTUNQKN87R91vtwliq6Wp
X-Received: by 2002:a17:907:1ca4:b0:c12:6dbf:4a80 with SMTP id a640c23a62f3a-c1fd295ec35mr86137366b.63.1785496852551;
        Fri, 31 Jul 2026 04:20:52 -0700 (PDT)
Received: from linaro.org ([2a02:2454:ff24:7210:4eea:ae3f:f2e0:1952])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3cc331fsm128489966b.28.2026.07.31.04.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 04:20:52 -0700 (PDT)
Date: Fri, 31 Jul 2026 13:20:48 +0200
From: Stephan Gerhold <stephan.gerhold@linaro.org>
To: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
	Amit Kucheria <amit.kucheria@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kees Cook <kees@kernel.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	cros-qcom-dts-watchers@chromium.org, linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-hardening@vger.kernel.org, manaf.pallikunhi@oss.qualcomm.com,
	Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v7 9/9] arm64: dts: qcom: hamoa: Enable CDSP cooling
Message-ID: <amyFARId5K-Izco1@linaro.org>
References: <20260731-b4-qmi-tmd-v7-0-3befd44403d5@oss.qualcomm.com>
 <20260731-b4-qmi-tmd-v7-9-3befd44403d5@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260731-b4-qmi-tmd-v7-9-3befd44403d5@oss.qualcomm.com>

On Fri, Jul 31, 2026 at 04:03:49PM +0530, Gaurav Kohli wrote:
> From: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> 
> Unlike the CPU, the CDSP does not throttle its speed automatically
> when it reaches high temperatures in hamoa.
> 
> Set up CDSP cooling by throttling the cdsp, when it reaches 95°C.
> 
> Add polling-delay-passive so the governor periodically evaluates
> the zone during passive cooling and steps up cooling levels when
> temperature stabilizes below the next trip.
> 

Would be good to mention why you are treating hamoa-iot-evk differently.

> Signed-off-by: Dipa Ramesh Mantre <dipa.mantre@oss.qualcomm.com>
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Signed-off-by: Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts | 32 +++++++++++++++
>  arch/arm64/boot/dts/qcom/hamoa.dtsi        | 63 ++++++++++++++++++++++++++++++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> index 9fa86bb6438e..a146be1cb5fb 100644
> --- a/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> +++ b/arch/arm64/boot/dts/qcom/hamoa-iot-evk.dts
> @@ -1684,4 +1684,36 @@ trip-point0 {
>  			};
>  		};
>  	};
> +
> +	nsp0-thermal {
> +		trips {
> +			trip-point1 {
> +				temperature = <105000>;
> +			};
> +		};
> +	};
> +
> +	nsp1-thermal {
> +		trips {
> +			trip-point1 {
> +				temperature = <105000>;
> +			};
> +		};
> +	};
> +
> +	nsp2-thermal {
> +		trips {
> +			trip-point1 {
> +				temperature = <105000>;
> +			};
> +		};
> +	};
> +
> +	nsp3-thermal {
> +		trips {
> +			trip-point1 {
> +				temperature = <105000>;
> +			};
> +		};
> +	};
>  };

Please avoid overriding node values like this... One quick rename of one
of the involved nodes and this will be silently broken without compile
error. Nowadays dtbs_check will *probably* catch these, but if you
override values using the label reference you would notice it
immediately when compiling.

All those nodes already have a label you can use:

&nsp0_alert0 {
	temperature = <105000>;
};

&nsp1_alert0 {
	temperature = <105000>;
};

If the same pattern is already used for other thermal overrides in
hamoa-iot-evk.dts, it would be good to prepend a patch to fix those too.

Thanks,
Stephan
