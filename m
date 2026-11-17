Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794894081;
	b=jBSX3oUuhJLqCtNmVRVdcn6LXz7LAZaq46t2QJdUo/c4iTDG23jGJX0bXOfoSyh9SzWl
	 q3flLxL2OGk6BhAoonFvC0dyhI2EfLyAWLnwjPLX1yiYPe/l3+75NahSA+Audk94J5Kpk
	 uQujzMj3W1yxvV7G+n2UgCwgWMDDPaoj0V7wGX0bMaMwNLhlYkMPcXBlthEkg5ld5iiD4
	 UlkigVodfv3QtB/S+o/Ebqbco4dd4X4MuxRfk4Kbtd43d04Accs3asZ9EJF0vzhCs0NJe
	 kHoA1M8RxKg3e9uVO+jUi5nnFDaRJTKWOu5hWaXPmK5TqUvkbtlmddv6I8X65tzwHPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794894081;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=kgXAga4SQ2gGcYIcOPrgNzb4Xfca195d5V/zBY0TA5E=;
	b=hR4mLhWuRSAKsWnJWFEiiJfb0kuz6TQLxlWPE/v8KaSJ0bu2LwMIE9PV8m7t1f0GfWb1
	 0Q/hOFEXI40wCRE2iUB/u16EKRj4axJ0/spvq1B8KMGCDz3j/diKzVV3XQKMEQwazoyVW
	 tAUgzIDGT/+j+01sYRhfqFBXbRr2NMVXfnC3E9/7r/BgwhMI61+O3/CfkVSamWz+72cvT
	 6sDEoD6tuPkYfI8AAUjSjOowRhyj5pWk005pCxLkKXmUXxphydMKzbbQWBydyw9McLHvg
	 JDZUDBS1fivNVlQAzQ7t0Al00Y2s2HILMnQT1DHHdPr10Dr7cKN9Ryo44JrLcvw4w1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PQr3PgP+;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5C54606A31C
	for <devicetree@vger.kernel.org>; Tue, 17 Nov 2026 05:41:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A5C54606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=PQr3PgP+
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1b244fb7fffso5149431c88.1
        for <devicetree@vger.kernel.org>; Mon, 16 Nov 2026 21:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794894080; x=1795498880; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kgXAga4SQ2gGcYIcOPrgNzb4Xfca195d5V/zBY0TA5E=;
        b=PQr3PgP+hc6DT0aQU/F4mOKsRUSEulybv2c1ObP3i+DkihztlWEctX0OrUgl6usesp
         LjVss/ez54+GKqptmSO447ZTgQARt4/Hqnxbxe4wKrARIDHxATiTAuXAUYnd5srby+N9
         vIOlcV7Nd504l6AaiMlFfzLDi9l5+R6A7aeaaPeYS/SdAVWDOIhSPf47Riiy2R6M+m75
         Ukgmqhi7cJ0OgnvcKLaHEGrytFD+SRwSV0uvePUfCnI6UPFqzp3h2OWF+CpLD3vPaxqN
         L2GFjD1uwlGTm474BmzBxVLJXBEP3UcTQIALBo1pSXC6QfWbbogt02vvQ0hKRpb2TPsp
         1BtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794894080; x=1795498880;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kgXAga4SQ2gGcYIcOPrgNzb4Xfca195d5V/zBY0TA5E=;
        b=VijPfN/qK/hJ+zBu8Ios/XLzIxTuBI8wIOvxvoGGjWeA9p3LyPHYdwsAD2QPi3sgZI
         8uz9eCfHSwd4zOr08wWH1DtWWj9vCrSQ6UjWpBYsIo0BpxnWAoDR6kb9UokLZz4xqufS
         M6y/qJWRR53uZ70rfOYPAdVxfojXVpHtOQQD7IYKmO+PweTgQVjH9+YUfzApleIc8IMB
         lxmCkz/ZYfZleZCwTdF5yPJ4RFrXjLvOjaGYeLhKnKx0rzfzu0kCDsALj/C8ifHy7gEE
         6joGXZIj3v2LphCKC/etvbkd0RiSYXMPRSlxMhfG0gFWvJBC+bEONZorQyrGGgEMwXPn
         y+Kg==
X-Forwarded-Encrypted: i=1; AL+hErHpGx85CuFrB0yDvNtDMee6/qBuNV+CHjpfs6xIAjIVSxoQ09XI+gogzUZQe4PrpQa2T5CXwWxrUN/r@vger.kernel.org
X-Gm-Message-State: APuU4Z9tRMINSWSiRJO9gWWF2uxi6wCuQU5S8+NoVUMkY8aKK5KH7uaB
	t83Io0MCTwwj0FKbIeRqe05nyj/m84O/4xzuwz/GWWJ1PIwwW3is48x3a42TU6qprsc=
X-Gm-Gg: AYBFou1tw7094E5zefooyTqHfC1/uNqKIdE37lIMQcp8Zhb7/stcVvBMWuT0Pi5jYaB
	gyOmD8istlgPN5dPtRMM/LsEZKEhXpaK/IPDpBL9z0NiD6ED12kZUhDxLfUlRA3/ISAzrMkJD0W
	0HRdx9zrS5kB46uKcXdmRB/DckLaoljPZGwy7GR/MIwwccIgOJNkWzy33EvklszrRCnc5ksREZ/
	YnMvM4JdffAWIsOkhxlWPLKVAE9cInrIy2JCfAgeqteuh2INp+mR/OjRr2y5pxpf435lc3kn/0B
	kDwebju/WgxfhQcbmNAvBMeQf9MwRY1Om9ciQxcyHs6VtbZ3Vv6EQXU6PBBUOJ+LhkxfwCHbKsf
	En42GJEaYXzZdkl+WbhPD0kmr2IvDRfK8rd/fFmrBZ9fZaQ4VfucH7tcHLZ4SRlydqOywnlWKWX
	2tlRvI3paOjKngJrGvnOtQ0M/vonTuY29et4kdqCd9rAgT+fE6MT0lYgtqLIG/sxG/BkhjuCW2a
	d9QVcq66H+ygmfOP9yixTsx83jgMWRH+FJkNiAKq20Kaq2SFUm1h6y+ldo7k3aP9sV7pvilQnxj
	v4W/oIEXvEWi6VFSCIdgWWqiJjRyGA==
X-Received: by 2002:a05:7022:290:b0:185:4ad4:3d15 with SMTP id a92af1059eb24-1b503068235mr10688010c88.1.1794894079483;
        Mon, 16 Nov 2026 21:41:19 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b524049e0asm17957878c88.4.2026.11.16.21.41.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 21:41:18 -0800 (PST)
Date: Tue, 17 Nov 2026 11:11:15 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	linux-pm@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add cpufreq support for Qualcomm Halliday
 (SXR2250P)
Message-ID: <avvo-0Gj9u4ZdCyh@vireshk-B250M-D3H>
References: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>
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
In-Reply-To: <20261116-halliday-cpufreq-v2-0-e518cc055457@gmail.com>

On 16-11-26, 21:25, Stanislav Aleksandrov wrote:
> Document the CPUFREQ hardware (EPSS) of the Qualcomm Halliday SoC and
> keep cpufreq-dt from probing on it.
> 
> This is part of the bring-up of the Qualcomm Halliday SoC (SXR2250P)
> in the Samsung Galaxy XR. The DT changes follow in a separate series.
> 
> This work was made together with Claude, ChatGPT and Gemini.
> Reviewed and tested on my Galaxy XR, where cpufreq runs through
> qcom-cpufreq-hw.
> 
> Signed-off-by: Stanislav Aleksandrov <lightofmysoul@gmail.com>
> ---
> Changes in v2:
> - Add the qcom-hw binding from the DT series (12/17 there), so that
>   the cpufreq patches are in one series:
>   https://patch.msgid.link/20261109-halliday-dts-v1-12-289114ab8197@gmail.com
> - Use the "cpufreq: dt-platdev:" subject prefix (Zhongqiu)
> - Link to v1: https://patch.msgid.link/20261109-halliday-cpufreq-v1-1-d87a397396fd@gmail.com
> 
> ---
> Stanislav Aleksandrov (2):
>       dt-bindings: cpufreq: qcom-hw: Document Halliday CPUFREQ hardware
>       cpufreq: dt-platdev: Add Halliday to blocklist
> 
>  Documentation/devicetree/bindings/cpufreq/cpufreq-qcom-hw.yaml | 2 ++
>  drivers/cpufreq/cpufreq-dt-platdev.c                           | 1 +
>  2 files changed, 3 insertions(+)

Applied. Thanks.

-- 
viresh
