Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795691704;
	b=edmNMtqjtuYWqZkGaub/yXV2hew5U2EWVGOeS3HgJ6FAgOfux4iY/ZiqAIqOz85+uuDV
	 XBFsQ4Oq6IL/IH8HrjPQQTqtW77Z95RnO6Sk+NGNno44fQOvuhMWkuPTTXW7gzBtRTE7O
	 xBoEqjhQ5YSb5BW1ND+gPdRwZ3gNk91sGSC9P3O5NuBY0E+B1phuBKZccmGyIk0HIOSvc
	 SMHcUlVHgNZ0qfs/0PXN3d1ws41eyfn3dWlvPfoUAN+tEhim1lS59dcmMDo4YHKIrpi/B
	 E+KcBPBIO+wWcYGYrfTph94YiQKIEXPIu6qzm4EZ42xdfD9LdyNECaugY1zxdkbpIRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795691704;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=xZR+wq+01JBO2j6s4aTMFnOoeuX0T1ToCwOuNIBcgaU=;
	b=khHN85xJPNW/7RcwAadEX/tGuPaT5rzxDoJ5YhNAcB1Qa+eB2Cs21MnmLYnnCQsyudUu
	 8TMSuRNXfXX15FYXffdOAFb92z7dp80yt0YOQjmfiuF9ijsZVHZ+akSIL9kZOIl3L5pel
	 7mjm2ma+YXTp6RAPXaIodf6uuEfX34VE4ikp39xgHqxz9dlnOpW2kriHvj/vHZxaw0ip6
	 kSxfWgFDj3xXI6y35caGr+XXQhGBidXj+mrndpwtvoH8YgpKxlsDEO4vvVeaqTuVNN8XQ
	 292XrS1898yzT0Tvuq92z51ewqAYEdS9lJSH0sJCTFrOi2CjXVoEGHUdtBzOGsN6E8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irp4B5Ws;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A67606A32D
	for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 11:15:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 65A67606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=irp4B5Ws
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ae1da332bcso3574170a91.2
        for <devicetree@vger.kernel.org>; Thu, 26 Nov 2026 03:15:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795691704; x=1796296504; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xZR+wq+01JBO2j6s4aTMFnOoeuX0T1ToCwOuNIBcgaU=;
        b=irp4B5WslOZBw8G+iVikp/XSJX5Y2nKFHBm1t2G8Sa9CGXOobc+fnN82usfGSWtTqc
         /8QpwmdIEy5pxnU2YMmWjEpAw7Bb8ZD0MCBwcFFwr0dSgK26NS5UEMCgaf+gz71NcmYO
         sfURCZ6xtS/X+R+gQMTUBHmw9J7oaxyvoRpWqZr+HEhg2hN0zGoOk6S/Ed8lshxMRFfr
         zbBCdKQ/7kgyH4Y8EBcGhvnX07o9ODgXkB2K0TWyLNsUQzyCpFLW858O+NcazYa6W6XG
         Bwle+6HKN1aMlvcW0WgS1d3cEq7h8vsUnIrqO7PW+WtlZwaSg09GIFTJepH0QbbBRcc+
         xlQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795691704; x=1796296504;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xZR+wq+01JBO2j6s4aTMFnOoeuX0T1ToCwOuNIBcgaU=;
        b=C+Oq9KKumFMgVhvVnU52rpdPtdppJSjOmhDucORMboTXCVx5Xq5BrBSTKGFgiFBPqA
         bfd28JMVhQyDlfGc2kkNAg6oZYHVLQC5DIk6gZMB28td+iQ8o6yOYsxgFky2wiUFDZMT
         l56jClPVSre12w0luMGjVNz5whYcN1AizwhYLf0d+EpSy+OCVlsoFsxHUHVl5TxqtqCe
         htUvJxatVzNrj4SRIKLPbOUtDZLVUphgtpf05wqZdiQfCG5ZHI2tQbotREvL29KS6BkJ
         X/kB4M94Iyl0kW7sUJipWPnV7z8aSOI9uaF6rxCrAUOpHTjIMZ8r8H7FJIZNdY6vup+X
         lRqg==
X-Gm-Message-State: APuU4Z+c0ynOhziz5eDv8s0pgPu+9RlQbechFwmYdWs6py3O6s5bkkz/
	rIeuDpLH+1/3oRITqFRF7pI600RpDzTtdJtnH53qSE1eFypiKSS/X73t
X-Gm-Gg: AZFdTZccRFJUyaF5rfHhjCYwT/zmgQypmW3my+ZHKazQ/nbk5sHL2qmHLlWNyvqQqtb
	d1VucniGv046tEKxQFDrIXWrcPn0UHcoq0WsXZQVJqruKI60W3CnXck3Bc50X6A9RR9I4DwGUMk
	OOT0NrituapvgVXY4bBM3BhH8u1sD0W7uZ60lpG8sUEdnuD7GlbC/4AUzrBtAx1K3/IjObcMw5l
	YdUzXj+pAkICQVFkdaLgRYK891XTllCLr0Vf+EItHXcLiKkBWUs3qHEWXbQyQ9pWIJHp8JWX2Vg
	dRS8pMYCKAs+MkoJhjZplgQeIBKX9jggqZVAMSjD0khFTy2uQa57JwDTHFQCNM7CGQWajwNY+op
	Eqs7q6MuniMeTvWst4KNe8d3n0xnJnYLt+m8iLUj/JA9sKP0eXHun0pTH8WlOGuiQi5IIIfVBcY
	LI7CuMwS7yZY4oXd2js+2ZAWsC6tEmvpoRONpNoswqK00Q1M7e5HHip/ZYB8Ki5iHitI0mxtUyQ
	VXvtSnfX6EcfmmfrkFB6NTsbZCyV3IJIJPR7uvkVTLvVOd5ex0gDlmElILlpe5P/roFH1p/W55x
	qUye/ETZkX2mcCWnR80kUx55jtZ/7VEj9SWpx4lnyVd+IGlZ9jjCRVGTurYBbD7yhhJtCN4lJQ=
	=
X-Received: by 2002:a17:90b:48d1:b0:3b1:832b:bb3d with SMTP id 98e67ed59e1d1-3b41c9817dfmr19137891a91.57.1795691703719;
        Thu, 26 Nov 2026 03:15:03 -0800 (PST)
Received: from localhost.localdomain ([2406:da1e:5db:e000:2565:a988:ec63:8010])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cde6d03adafsm11030373a12.23.2026.11.26.03.14.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 03:15:03 -0800 (PST)
Date: Thu, 26 Nov 2026 19:14:51 +0800
From: Jianhua Lu <lujianhua000@gmail.com>
To: Jianfeng Liu <liujianfeng1994@gmail.com>
Cc: devicetree@vger.kernel.org, Abel Vesa <abelvesa@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>, linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: arm: qcom: Document Xiaomi elish
 panel variants
Message-ID: <awgUq1_piZACNOY4@localhost.localdomain>
References: <20261126063056.2276703-1-liujianfeng1994@gmail.com>
 <20261126063056.2276703-2-liujianfeng1994@gmail.com>
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
In-Reply-To: <20261126063056.2276703-2-liujianfeng1994@gmail.com>

On Thu, Nov 26, 2026 at 02:30:33PM +0800, Jianfeng Liu wrote:
> The Xiaomi Mi Pad 5 Pro (elish) is available with either a BOE or a CSOT
> display panel. Document a board compatible for each variant so firmware
> can distinguish the corresponding device trees.
> 
> Keep xiaomi,elish as a fallback and continue to allow the existing
> two-string compatible for older device trees.
> 
> Signed-off-by: Jianfeng Liu <liujianfeng1994@gmail.com>
> ---
> 
>  Documentation/devicetree/bindings/arm/qcom.yaml | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom.yaml b/Documentation/devicetree/bindings/arm/qcom.yaml
> index a7157795870cd..84ae2d991d628 100644
> --- a/Documentation/devicetree/bindings/arm/qcom.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom.yaml
> @@ -1192,6 +1192,13 @@ properties:
>                - xiaomi,pipa
There is a "xiaomi,elish" string above "xiaomi,pipa". I think you should
drop it since you add "xiaomi,elish" in the following.
>            - const: qcom,sm8250
>  
> +      - items:
> +          - enum:
> +              - xiaomi,elish-boe
> +              - xiaomi,elish-csot
> +          - const: xiaomi,elish
> +          - const: qcom,sm8250
> +
>        - items:
>            - enum:
>                - microsoft,surface-duo2
> -- 
> 2.47.3
> 
