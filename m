Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795821307;
	b=E4bGRdkvTANt2rTNMY+7dimOhTBOhEKbwlOJDjUdW5nZHillTcpOF13s7KrAHRNsPlkP
	 YP2JkT1ustWSQlbp1dWtNvrtOBOml58SJ9RacgfmgODVcVp8u3Pr9rKEvVkqAIiz/AvkZ
	 76wdJ/cIws0y8G560ZTYKuO9my9HlS8b8HgQDVZcjM/Wq+ol/eacqnVkxSnDu/awAeFJf
	 YdX2/kobOhRJPdFoQJO4FT6u4EEzsdfTVa0Z5LxgZlMDlclK3T7hNrJnwgxh6LGTKj5MK
	 1OZDXHL176VRaEWmX9eLeVSnIA6vQFDU571Ub+dRDgDxtAQ1PQk/C627J0IGCDM3v8Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795821307;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=U1M+MDeqlkODjZ50qKjXMO75f40J30DxxF3l7NYSGEM=;
	b=cGZKnVMfWpZVwt1mIcSAjkq9Zojx+QBhRKi2+cBw7OyhveGPeV55Qt7nHrJL4J/yld/s
	 r8otXaQGvZDV7o60TYcohrHJfDYWAINmIH33JDS5K19lxZ/9gXe/4rutbY9qWl1yyp7Rj
	 09+oMqRUyoM5cwcyCMA5GZpfhSFnbn3kH+edpEPrGjJQvprGQeRcBz+NVUjC32BVo6DZX
	 Z5tFmyuq8fmP61K6WTZEJ/QLW7r40E/1K8tSIQb1zRDBsW9uBJp2BjzdLeeltOjSxBq88
	 3S3q/vRMU7RCSxM2onY/ggd4hb3Ia7KV/OZe+gpVSVOwaxY3zI90ZLvmncpy4lgvNBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WDrBk4z3;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CB77606A33E
	for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 23:15:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CB77606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WDrBk4z3
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4ad6219f7d8so7732769f8f.0
        for <devicetree@vger.kernel.org>; Fri, 27 Nov 2026 15:15:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795821306; x=1796426106; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U1M+MDeqlkODjZ50qKjXMO75f40J30DxxF3l7NYSGEM=;
        b=WDrBk4z39jTSJg7fP1LZv5pSAmcolbmVo4wwWMjjlFQboYBu3wN5rJ9GYnYJV50K3+
         tkw+jwH1lJXR7gVV/OBT9/yk7tTAiZrdu2ajb+eYT+UVhWfUsEfp6iR0FSExSHMDzvsZ
         3fpjMgMby8qPK4rdWEnPxtHr3jKM0uthso6MfAww0lrr5k/+C3OtKtXfdvcLi7gHPltW
         qCeMSaWpCWUuLbQVELMCkcXgultuZ6nRhj58FRGzZaFMWHaLx3Tjc30C/hZ5vAlCSiMn
         7dF5c687gdpqCnnInSFJs2GpiUdsUfdCYGv9dUppGS+08fFr1MS5RebwLf1K2w2KKf8y
         FyPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795821306; x=1796426106;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=U1M+MDeqlkODjZ50qKjXMO75f40J30DxxF3l7NYSGEM=;
        b=Nmxb1gIYrHJ45R5HtlsfG/xAPqpZ5VOhLyQydpXZw1lwwWo1JXOo285crDVVG//9qW
         KxmZFNxvyYe7p8fhPpi5uIlJdPkK7d5hHbB6fkubo1PwTNTgv1E1taG2+AiTNAtiae5P
         hzr8RP+zIZFRYLzzCI00xtGlnnigO25vzM+ITz809NPnv1IhhQCgADuBaNx1ki8i8nJL
         ltx/fexGAgTMNHMHExJKwSKEouzu7/7cZZwb5GBfOhWjV7bL2DsLnTMDDVx8gLg4BIlE
         DZ+eQTfDJ28zyyA11fxfCCvZDUUuN4nRvg/Zl5BqalPGFTMTibWSJ35B9I1uNgRD9nTb
         2cew==
X-Forwarded-Encrypted: i=1; AL+hErFTogIt0gOTfSuQQVuIjXT6DkhpWeE64BdtIVrjeN5y0nVwofLD7r8YHLnAEmDlaFKTZrZ1qooEq6lr@vger.kernel.org
X-Gm-Message-State: APuU4Z+YYueRmsGBhH0eRyLJwmQWkdfI4Zc3eAYikowMYZDSkEvrqLyM
	tERQrdSKYR8uKd0s5pfiyXkHoMuQOYUXV7tws9q5HMaLl+pJrIuOhE13
X-Gm-Gg: AZFdTZeLPNjkcJoDR1JiwvV7mRe1Hdr8xT03eUDdP+FXuP+y/UU5xGgdsB/5312wq05
	FrnYXvRX0Pw641NQgHgQe/ssxx3fo9GDBFnr3+8Q7ZvWIDc87uM2Og/qfVmEg5PTrBKboSVaz72
	NrDr7+s0FZX2IyQ9y+2r2yBCm/CCZ91iv65lZj96FA0NchmhscPQOBABbTTQOcv0v2OFyZyePRr
	1ZlG2ucbDg9AFJGK3X9OeacRXqKsCaVxauUdLB1epyiBn1Pdnmfad7JvSdYVs0qdukl5Goyfm/r
	/ZFs/vEWB6VFPPvOjGPfX+ximuVXJfycqhhfNn6FIvDcQWPwDQkVKEpaPmgnzETmC6ZqeFdw4gS
	DOVA9XshvhsxjZVj41ZuvSBgYYLh8HiFdAFIVMNqPigVNC5YPhYHE/3/qy07+Ip2VxZQKVF88nY
	Sl7FM6DRRwk3qkDCNEY87hiOjLmc1xwbzghK+g4QBwTXBoLcwnYbYYQN/9nD3jRG/ESPE3CG7tL
	CzoJTyWxvsBgnLrNyBVlPBFAh2XKeQHEixk6P7FZEc/xzQ2Ml915PUBVOFcUkmd3NEH/oJgwxPK
	doZmhy9RVkUvLldg3i+0Omiz8Is=
X-Received: by 2002:a05:6000:178f:b0:4bb:c85e:d565 with SMTP id ffacd0b85a97d-4bbc86e17b5mr14733028f8f.55.1795821305534;
        Fri, 27 Nov 2026 15:15:05 -0800 (PST)
Received: from flare5 ([212.58.121.92])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6a67fe48sm45269880f8f.23.2026.11.27.15.14.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 15:15:03 -0800 (PST)
From: Stanislav Aleksandrov <lightofmysoul@gmail.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Robert Marko <robimarko@gmail.com>,
	Guru Das Srinagesh <linux@gurudas.dev>,
	Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Bart Van Assche <bvanassche@acm.org>,
	Bean Huo <beanhuo@micron.com>,
	Stanley Jhu <stanleyjhu@google.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	"David S. Miller" <davem@davemloft.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Amit Kucheria <amitk@kernel.org>,
	Thara Gopinath <thara.gopinath@gmail.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Zhang Rui <rui.zhang@intel.com>,
	Lukasz Luba <lukasz.luba@arm.com>,
	Georgi Djakov <djakov@kernel.org>,
	Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
	Ulf Hansson <ulfh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev,
	linux-usb@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-scsi@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH v3 14/14] arm64: dts: qcom: Add Samsung Galaxy XR
Date: Fri, 27 Nov 2026 23:14:45 +0000
Message-ID: <20261127231445.3623202-1-lightofmysoul@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <87280d80-9047-405b-8dcc-11276d34d2dd@oss.qualcomm.com>
References: <20261125-halliday-dts-v3-0-5c8311c0b70b@gmail.com> <20261125-halliday-dts-v3-14-5c8311c0b70b@gmail.com> <87280d80-9047-405b-8dcc-11276d34d2dd@oss.qualcomm.com>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Fri, Nov 27, 2026 at 02:58:40PM +0100, Konrad Dybcio wrote:
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Thanks for the review.

I've implemented support for almost all of the hardware in my
local branch and I have found that the headset exists in multiple
revisions.

So, I'd like to make a split:

rename: halliday-samsung-xrvst2.dts -> halliday-samsung-xrvst2.dtsi
add: halliday-samsung-xrvst2-rev22.dts
add: halliday-samsung-xrvst2-rev25.dts

The .dts files will initially contain only compatibles.
The real differences between the revisions are the DMIC drive
strength, the display panels and their supply voltage, so the files
will be 'empty' until I send my sound and display series.

Is it OK if I send the split in a v4, or is it better
to do it in a follow-up?

Best regards,
Stanislav
