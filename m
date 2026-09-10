Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71123BBFD8
	for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 07:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024433; cv=none; b=I48UhkGVwo+eyuG0JgJrkdloXPA99qKfCIdI384TpieSXG5Tv+3TcL6qznEszlJga7FLgtKoVmNNCGVHFcGDxxJkGI6txdcu7pMrCiE9XngyqicbT7sCjFaWeDQB9JYwytEb/uTqs6NI5hhZd/2BxpvZsPl5R4wLvjV/5RkPxJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024433; c=relaxed/simple;
	bh=PXh2VO4rYITeX70Qory+PjUUOYjC1peCD6QzzIWZTGA=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=iuzcp/RC0vkL0A/lU1zIelGLaw/iM9m8p4TSUbTxHFZfarloNqtdhxFfhobFUdHNw9coUZQFFEyXZOprjoEZAGC38R8gUMaWY47cFIxcKvAX+GZt3P8Wd574SfL2jPr1fEOAfH94M+7fUT62NWBkQmIW8eiWLanUsWBHU+Fu4WM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XnSubBxC; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XnSubBxC"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49a97714f5dso64587465e9.0
        for <devicetree@vger.kernel.org>; Thu, 10 Sep 2026 00:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1789024428; x=1789629228; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S9vc3vyc7s51kw3mexUDG6KTzAQ8qZ7SaFb2GyTr25M=;
        b=XnSubBxC3C1UMzn4ifsusKXQhYpLF46DzrP7kZnCbJfwQIHH+eOzVojTe2uO8Gf0zV
         eUvUdcWbIq0Ehq38oL1VU619DMYWI3xODqkY8zSzE63W0obJaAc4oCkBMrv5srV6C+2c
         waEQlw/O1VbxlaJC2zylCN5m11FSah3tIk1OR9cczLLQaefD2/PkEz+/PKl3zUUtbko1
         mWkMhhApDfrjR1M6XbyN8v1J9hI1c7Q4LpiFPQD8lLab1BTK1NfhCjDKah+EO3y/LhJz
         0NVegKMFCTc1L55TTDJk1MvOJ70OLesgYgmopuSTHgi2t75KPbsQxFjePWRSdynd9e0P
         VP8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024428; x=1789629228;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:content-language:references:cc:to:subject:reply-to:from
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S9vc3vyc7s51kw3mexUDG6KTzAQ8qZ7SaFb2GyTr25M=;
        b=lJU62Mxw1kj4oRyZerAviPkfPubzbOAbgJilMBPeF8352XBugDW/sl8yeQfjXNHPDR
         NSz7+Ut3mY3QDa76lkjmFVWQqIYBqyU2aB97llanbPhWnvylpL0Ry/vjM18ZpcnRO+V6
         nQQluklqzHJham4mlw+SNAOOaKBIqgmMOnXIt2Rbqx6IRj0MBeGg63rpuhvwqdGUdfiZ
         7XC3WtPNtmMNCJ4EIRdpZdsf7G9KO9j/48k6Lfd5mADpJrQVfUaKfHJp2Z0zjm1Ujtba
         f/GvleAuUJ9MRSPG92tS52E4fzKtuW9B5mjZHpagONF50EkXJClDuW/H9l2v2K6GUz1h
         Rq6w==
X-Forwarded-Encrypted: i=1; AKwUvByqszBr/1PjAQpybx4y4LSR31tH2zBTCcxLbVO87fZIkCF2f0fRqGmT9tv/YG53/18KQQAOgUYQt//L@vger.kernel.org
X-Gm-Message-State: AFuF++l4JPADRFmtibMwEsYm8ucSRfZb8ufLhSIH0pAsbnrXVKBkAwrh
	wHv/01BP/uC3mA0rHXEHNcWkams38aEIGDVi8y/AFeQOL+HxkqCp2YayOjFO85RpCbw=
X-Gm-Gg: AYBFou1hsYQ8oDY9aTmrm5D0RsajoQTCNrnvXwk6MU1UywjgJEyk1GzhTJ1iPY+17pB
	WD/FbTwM+A4CWXBjy4QLfYNbUY5iKLrm+9xX9Vpml54b2jmcSd6Dii+h5KPM8EmtkRptsphJBNW
	q67soPkELJwUKntbfYmJ0TI0aOfcn1bmC3PA9Xd5jPPctA/xzKHx/xa2rkbAVR6DuosUjtG4g5x
	C52M22aVjnwfzErXQ+OcYVO2i725TJPxpB+iJ/6piFMQ/CdVdDMc2RLKZjowesanbRpGGXQJqxH
	XJYx4hi2JTJ88kGlaHm9EoF8AN5CtFpqlnvErnXC+rE9TzdFN76El6lyr3A4+VK3crcpo6gFhss
	IqNLyDiF5QkECRySQQNu8wv/7imbmDtHnMgFYKLTf1wdLJomtpSHvbf3FbPL8la+9H1SfFO7Nak
	s98j5E4I3B6R/ZqO5wXY00XjLzVS2iRHSjGaQIjfX3v4Rzm8Dsv9EanRVTDtQUi6ytr8svCNgjO
	+StcBdvJo+ibvb9RBo8qvPtLyYYXsJLJZdRAv3CYwRtS2YqiXo8ZnAkcwzP9rySAQ==
X-Received: by 2002:a05:600c:37c8:b0:49c:cee2:a508 with SMTP id 5b1f17b1804b1-49cf826c4e2mr379662315e9.16.1789024427828;
        Thu, 10 Sep 2026 00:13:47 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:106d:1080:3caf:d840:c911:29a9? ([2a01:e0a:106d:1080:3caf:d840:c911:29a9])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4858d312ca0sm51612002f8f.4.2026.09.10.00.13.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 00:13:47 -0700 (PDT)
Message-ID: <d2e31f11-24ab-4d2e-8f49-d625e1aec930@linaro.org>
Date: Thu, 10 Sep 2026 09:13:44 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH v2 4/4] clk: meson: t7: don't mark sys_ampipe_nand as
 critical
To: Lucas Tanure <tanure@linux.com>, Ulf Hansson <ulfh@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>, Chuan Liu <chuan.liu@amlogic.com>,
 Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>,
 linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260905153234.133217-1-tanure@linux.com>
 <20260905153234.133217-5-tanure@linux.com>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20260905153234.133217-5-tanure@linux.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/5/26 17:32, Lucas Tanure wrote:
> sys_ampipe_nand clocks the pipeline stage inserted in the bus path
> between the SD/eMMC controllers and the NIC_MATRIX fabric. It does have
> identifiable consumers - the three MMC controllers - so marking it
> critical was the wrong tool: the clock should be referenced from the
> consumer nodes and claimed by the mmc driver instead.
> 
> Drop the CLK_IS_CRITICAL flag and update the comment accordingly.
> sys_am2axi0..2 remain critical as they clock the AXI DMA bus itself and
> have no single identifiable consumer.
> 
> Assisted-by: Claude:claude-fable-5
> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
> This patch depends on the MMC controllers actually referencing the clock:
> the dt-bindings, mmc driver and t7 DTS changes adding the "pipeline"
> clock must land before this patch, otherwise the boot hangs and memory
> corruption this clock caused are reintroduced.
> 
>   drivers/clk/meson/t7-peripherals.c | 10 +++++-----
>   1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/meson/t7-peripherals.c b/drivers/clk/meson/t7-peripherals.c
> index 55d09e78593b..2f429ea86796 100644
> --- a/drivers/clk/meson/t7-peripherals.c
> +++ b/drivers/clk/meson/t7-peripherals.c
> @@ -945,13 +945,13 @@ static T7_SYS_PCLK(sys_aucpu,		SYS_CLK_EN0_REG0, 14,	0);
>   static T7_SYS_PCLK(sys_cec,		SYS_CLK_EN0_REG0, 16,	0);
>   static T7_SYS_PCLK(sys_gdc,		SYS_CLK_EN0_REG0, 17,	0);
>   static T7_SYS_PCLK(sys_deswarp,		SYS_CLK_EN0_REG0, 18,	0);
> +static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	0);
> +static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
>   /*
> - * NOTE: sys_ampipe_nand and sys_am2axi0..2 provide the clock to the AXI bus
> - * used for DMA between the peripherals and the DRAM. After the clocks are
> - * disabled, a device that starts a transfer cannot complete it.
> + * NOTE: sys_am2axi0..2 provide the clock to the AXI bus used for DMA between
> + * the peripherals and the DRAM. After the clocks are disabled, a device that
> + * starts a transfer cannot complete it.
>    */
> -static T7_SYS_PCLK(sys_ampipe_nand,	SYS_CLK_EN0_REG0, 19,	CLK_IS_CRITICAL);
> -static T7_SYS_PCLK(sys_ampipe_eth,	SYS_CLK_EN0_REG0, 20,	0);
>   static T7_SYS_PCLK(sys_am2axi0,		SYS_CLK_EN0_REG0, 21,	CLK_IS_CRITICAL);
>   static T7_SYS_PCLK(sys_am2axi1,		SYS_CLK_EN0_REG0, 22,	CLK_IS_CRITICAL);
>   static T7_SYS_PCLK(sys_am2axi2,		SYS_CLK_EN0_REG0, 23,	CLK_IS_CRITICAL);

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil
