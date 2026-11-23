Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795410806;
	b=OVXkCEpLulN/ITfrZnT/NEiu2cbx9dpCL+D6Dky4uLhWFnjjOmtUCLnUMcP+Blr6haEl
	 15UIvhOZqjJuU99F/XvzZsVA9GDHXIineBg4cuz7sJpUR3+JostxuZu5wYbN+gYZOIzDK
	 h5P9T1cmE1eRQt0lNi6jP0pNC7mrSR7JehD2zlFpyo//MYH/wDw5qpU8sEJJ/IsO9lTiw
	 rT+XJ7i9+3NFR0BSTotwykTWduqrf0dClrapKAAbBWrZm3Uu8Fc6rRpukaXisN4KHcrfc
	 8sqFGlrNv338Qx9sugp+Roqis9laMDcfG7lucEUzoOywjqxUGHtw0h9p5g7hhf4XhDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795410806;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=FUqLDQXnSJ5sC0anYruumGCX75FgOtK3GjAUXxEI5pY=;
	b=mNJt9e9f1nTL8qH9zSNDSpxs6uEAS3rV64+OOH2ZhW8LQxQ6wIbfXDBBMEYJNO7J7Qvb
	 qir4hvfMUGjhvR0lThWLNa4uIM+ZUEcWnq+Z0yLWYpOC1uznK8uq9yex7d8VWCb/uIlup
	 10zgHfdAzr32V3IUzm1koLgXlgt4/oqj5SToZTcHzwJE0az4kCKQh83X43gsnHBlgu+ik
	 0luvT+JNdLnRUPvmywwogM33HvR5MTk0TeqKwF/6WDrYEXsvZ+VCktbM1XM/8kFV/UID/
	 iYmQHgXoK3gwWBqurNjL2TfWSte5hSJNRRr8NwnIaR0/J31ZR+ZfI8XUpTpfS2A0O+w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KtX90Ghz;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6E41606A31A
	for <devicetree@vger.kernel.org>; Mon, 23 Nov 2026 05:13:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6E41606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=KtX90Ghz
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-380b40312e2so6987062eec.1
        for <devicetree@vger.kernel.org>; Sun, 22 Nov 2026 21:13:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795410805; x=1796015605; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FUqLDQXnSJ5sC0anYruumGCX75FgOtK3GjAUXxEI5pY=;
        b=KtX90GhzAgzwullsj9/w6X/vYpZZ0GzUvIbI/t0XEP8YyJe5pnuckDlzfsjV/8O3pA
         AJmxr5xfSgjTXDKW6yJnQrqL/Ddq9oK98rH/bsj8s+WkSSeUCg68Mv2HTHTYJT1S6Gf6
         TMmrzC8+Y1Y00HDJF/kOBtjahqY2cI9Q+3X114sy+vTb7s6W/3Dn9owYaq8RGdvQYpeT
         n8nrodF0buc5d5gYONrNn4hWRrT47+d055hnk9TdtnCNk7D4emoWDMbsDGNcoj06VZWG
         oW0IIuKp2/AoC/e9AFDer/+f1zNzFt2/9kCY0zwrVR7t29xPMqbd/QmEYDYwoWbh4NHx
         bKVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795410805; x=1796015605;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FUqLDQXnSJ5sC0anYruumGCX75FgOtK3GjAUXxEI5pY=;
        b=qimxjcpgefOP0E0g4YV/jDWzUN7AhjA5SBVLo6jyIMadzNELEHqz9TGeVKulAacc86
         PGjajZ4253lb2AcPD3CZUo3UR/t7JEZCpwN2bAOvmxwGZlRhbFsDHTAYnTy30z604SNt
         R/InWLBUW4Xf+YTYCk7AKqK56osMZhfRzYtIjxv6l1Ceqsfqy/a+FmvTiE3JBwC4TFFt
         FCXAN43MhREhTRLEpFJqExq3p/LAY30hCVXX7T3s7w4WuuuxFKmypqYiCDMGrZ8nk4g1
         p3hVZhksRWrn/3ydmciTa10UCIMyqqHQ3u1pIQPhoeM0bTLiyHMwTarAhETqyqLYmw0U
         XfEw==
X-Forwarded-Encrypted: i=1; AL+hErG3yl5cQlVkdtrHsINbh/daOYow3Hp38FkQTC1Vq2ykxQRUoWLUTdiR5XWzzz+c3DujiXJHbJvtiJJL@vger.kernel.org
X-Gm-Message-State: APuU4Z9XmYbaWMGShFy0mRZr870JHqxRB+M2lGZSenkAnh1/umJBIrt7
	wEc/4J3dcHw+jS7PACz3nPNSAKhUD3L84pslruEbhrX19/HVuICs7nP0Y5b1gTNfhDs=
X-Gm-Gg: AZFdTZeMedr7iLXWtsNm+kczrTd/FlXL3XWi8m6N6VYFLcye1EuR/8LR+ZXaY7Yb4V0
	b4Xse3aEVvAC6vbt9IQcjRv5VmgNGqQmnzBFcszt6KxpVq/2DJhgs3GwU8UC4i4nPE9fsC9iBHM
	qnE1t16LZiDcfA0YlhGpZ4ylEHsoxIJL61sU9AEx47vqmscQFNypqternW68pRrOoCAE9J/eRLl
	cbbGD/9KvfkceYsl5Ez216D2fD3S5sLiF9JZaFNvU/cOEsxFHDlp6OuoRk36BlcyaDbysDeKPNI
	fDBE8O1OEca/3rpIqKzzV52SPPx2GDNF2+7GUadd47zPGtWQZ/4aTM/pdYckzHhyTpYnV5TgRIj
	fc6Uf3rhCisiBignE/r7+w/agCMfOwRRfKKaSA5A+umajerKIagqQiTFz8kXJkZu6Cc+3cXj9bp
	zGWtDohUP154OU1L8oxfqrAkflqjr8hPznGMeJntYd5bLhpE6LPXv83V0XgRF5MgBD8OFPY/POY
	k9GdpVbv4mT+LV3omKbsVNpj58tpLDXfcgZlOPNEdgLRiNnPBvuPp9iSA1UFrRu3e5M9TH78j5I
	n7edwOAs3pQST0fUuNHl5l5vUSZhPA==
X-Received: by 2002:a05:7301:4710:b0:378:314:4042 with SMTP id 5a478bee46e88-385702587c5mr10487392eec.14.1795410782709;
        Sun, 22 Nov 2026 21:13:02 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385f68bc0adsm28221624eec.13.2026.11.22.21.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 21:13:01 -0800 (PST)
Date: Mon, 23 Nov 2026 10:42:59 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: michael.reeves077@gmail.com
Cc: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>,
	Neal Gompa <neal@gompa.dev>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hector Martin <marcan@marcan.st>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/5] dt-bindings: cpufreq: apple,cluster-cpufreq: Add
 M3 family compatibles
Message-ID: <awPLW-zURwW1dqZX@vireshk-B250M-D3H>
References: <20261122-m3-cpufreq-opp-v2-0-3c19963f55ee@gmail.com>
 <20261122-m3-cpufreq-opp-v2-1-3c19963f55ee@gmail.com>
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
In-Reply-To: <20261122-m3-cpufreq-opp-v2-1-3c19963f55ee@gmail.com>

On 22-11-26, 00:18, Michael Reeves via B4 Relay wrote:
> From: Michael Reeves <michael.reeves077@gmail.com>
> 
> Add compatible strings for the Apple M3 family cluster cpufreq
> controllers:
> 
> - apple,t8122-cluster-cpufreq (M3)
> - apple,t6030-cluster-cpufreq (M3 Pro)
> - apple,t6031-cluster-cpufreq (M3 Max / M3 Ultra)
> 
> All three are compatible with the M2 (T8112) cluster cpufreq controller
> and fall back to "apple,t8112-cluster-cpufreq".
> 
> Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
> ---
>  .../devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml          | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> index b51913a81791..516216cb6ad6 100644
> --- a/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> +++ b/Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
> @@ -36,7 +36,11 @@ properties:
>            - const: apple,s5l8960x-cluster-cpufreq
>        - const: apple,s5l8960x-cluster-cpufreq
>        - items:
> -          - const: apple,t6020-cluster-cpufreq
> +          - enum:
> +              - apple,t6020-cluster-cpufreq
> +              - apple,t6030-cluster-cpufreq
> +              - apple,t6031-cluster-cpufreq
> +              - apple,t8122-cluster-cpufreq
>            - const: apple,t8112-cluster-cpufreq
>  
>    reg:

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
