Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794744890;
	b=3EC187LqySjmxDOjNGuKxfesCkIRUtfZ/fbo1PY9ocGnqBvGDCpJlI1/4uDY4boEcECI
	 Ymt5VxP5vGnqlNAlA6CPv9q/k2ZnHjp2qHhJX7OGXXJFSApgm8qpkvdjbtcSDCYA51DXr
	 lMRLfyHL1oUhv5BeLVVcx1U+bhGmNJUijFToet4mUy/fqOVgPU/mVeoXxqa8CKSEZoWt2
	 aNpUVQl88oD5Goqfkq1/8X3GxBq5vul68ZFVNMVkaebiF+yiag+mm50C/7wkDtbKL5UXe
	 RZ1DedQX/hB1p7dMd9easEjL3NtF3MJGpA4G6J3PsSn1aO9kJuf/SCBmpVqiWh09dEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794744890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=uGgu6l3Ky8kvEE8GWOoo1yyQfvRZHOX/bqL3OvucLGQ=;
	b=EnpAg2Kqj5/mkRG8raVAyyAyobdW7Bd9WQ+Bz2kFrEiqohhGh+NQIQN9Ox+P/QoFBfVW
	 GdojrnQ5WlEbOk+yuZEGpEiSYLzKvFtRgKRmFBGM9YQTisQLnsmqLGEB/70x7SbynKmMO
	 KUKi21eQtRsfkflDtKKzAnMPki7XL0CtD/h07ELec6MwxRP01Gx3tOUmw5Y65+GLsBmFc
	 OX/OjvejS+iH1lGPRcaTISPVekzBkdCFzSV09ZhtAOVv11jRlNN1ZSYBQmKMHDCoVZWv/
	 OcZUa/wq39zoid/q0Ep9BKkbZgiZE9SiMB7Jlz8XhWuDcoPRd98jhOAHYy0w968h9Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eJL4Fmsl;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB025606A31E
	for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 12:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB025606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=eJL4Fmsl
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so2293405e9.0
        for <devicetree@vger.kernel.org>; Sun, 15 Nov 2026 04:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794744888; x=1795349688; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=uGgu6l3Ky8kvEE8GWOoo1yyQfvRZHOX/bqL3OvucLGQ=;
        b=eJL4FmsljjmbthQTxR+1os6ehdA7HrXEazEQbHBtVieR0VPO2U/151cbAENNQpoh6i
         ghPT2cNYVo/lKqchdC0hTr2bHtSoCLidj7k1RSNtzrGC2aEcv0oQykcRlSDYypHCGxWV
         oN9107GYTlhdT2MgiIYtt8UXLvULIASeEkedrMlyX2xy2b8jmEPafnLnSNvUY5lvOeTo
         NXPWb6KvUlNbVtI1IKG8AeHSgzyPBKF3JHGZ8q3aDJQRXenTqEfz5BJ3U/dokIfbdvcf
         Slsbh7fCBGjSc7Gf77SUlg4j2wDW8AntcikkdGFAmrFijCPF0/nFgH21Qncq2ebCqEGD
         f3DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794744888; x=1795349688;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uGgu6l3Ky8kvEE8GWOoo1yyQfvRZHOX/bqL3OvucLGQ=;
        b=y/tHBnYN0j3MBvTnQ3omonHwvk5nONxP3lKXLNJ+J8jLNgAtXeukavY4auUEcJVrnN
         8utVJb5ZNpZyz3oZWqVtHp7aGGYZwzuB+2Q9BxaNUQRifQ09E2dV1UH0E3nOngBEMews
         a9x1whj+4WjwCyJbyEMEnJUFWWhh8niKq4B302wr6zm1JQ5F8ffv69j+aj5asjfkRF7n
         7Es2Iax/GaBawEKH2xEV8jp/V9G+AVF4cRMp5vhU4rbZnn2l9pB4XFOVNAfMcej7ldw9
         oY0sfTqd+Y5XJbIPZ13sdEgywhXrQJkBBzGyjkHPjWgxg0GRBXZDIZUE6OJJgU1fMggz
         F7jg==
X-Forwarded-Encrypted: i=1; AL+hErELJmOCyfKer7nxZFJ7mSWzXkyOnm+mQAEFJAgHzh7nEGgKf8WnmuNiGDmIS6/jtnno6WFWVU6uQS6O@vger.kernel.org
X-Gm-Message-State: APuU4Z+EvP+iBbG3ikipZdrCc5sLbRGg4hk4EbRgMgckBtITJGxA0Fia
	bZEzUcZ9g+5cu9feJxpXa5fduvlnSNWUzxAm5fv+Q6rwYHsSFnlM4zefOK5GJeYaAts=
X-Gm-Gg: AYBFou0VUgcVxwlmd4FXpCb8XS3LdlN42c6SPNDiSHSUDczBoN8I1oBjgLC3SOezd+1
	WbMITQ1ZtDXRz6rk1jXJk6podE5LCRmx2xqZi0J0VDvnWSNqEtLR6yBcXECMtxWeuiiA10W3bGS
	zVnaxP87TRpLzEGYZr/B39pOZ7DVVQm5uJgqsJzT3XVl1nI/lQHN8kvuPwU8tKugADnq5rqCHfx
	PZ79RULIxuPT+oBrKt1tCZfP8X3Es38VXZYnL1JpAWUH2uylA7p8uAuV+DTG9MaWQ3K3dtFx9Q6
	9yCXyPGdLAWF4b8K6PTQ2gWDmt+H3Of3PKKlbmUETQNOPMfBCd5g2ifxfqNFmOKAdzsnT62ebhG
	jAAGDtj4+mCO1mMnK60xQFWnPvUkWKn0qNxfgDSJhNJbz72Qg4D5hTFpnqEYvX4bLrgs9jI3aJz
	WsLJM+82hlYtWP8eHGk7KrN0o8lBvGHDzW9+iqmndgcL3V2zbn/9g0T08DiQjTgsvMq2LW2GNYI
	V7IbEv0QhGBFMp4TbY4jsUMeV3ZrBvaT0AVwIJxH950Gc7XmQdqKL6EJsJj0LUlId5509nym8iq
	XraeB604dUZ1C9D49oFIkFiBVaW4OBF3bHnXMCGmJj/v
X-Received: by 2002:a05:600c:548e:b0:4bb:5c92:ce12 with SMTP id 5b1f17b1804b1-4bb5c92cedemr125712795e9.17.1794744888294;
        Sun, 15 Nov 2026 04:14:48 -0800 (PST)
Received: from [192.168.0.167] ([78.152.238.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49dc430fa15sm10124007f8f.13.2026.11.15.04.14.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Nov 2026 04:14:47 -0800 (PST)
Message-ID: <130fecb6-5372-44d9-8261-c3ac88248631@linaro.org>
Date: Sun, 15 Nov 2026 12:14:44 +0000
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 10/23] media: qcom: camss: csid: Add support for CSID
 980
To: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>, Robert Foss
 <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
 Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
 <20261114-add-support-for-camss-on-sm8750-v7-10-8ff2a11835f6@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-10-8ff2a11835f6@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 14/11/2026 11:29, Wenmeng Liu wrote:
> +			for (k = 0; k < CAMSS_INIT_BUF_COUNT; k++) {
> +				__csid_addr_update(csid, i);
> +				__csid_reg_update(csid, i);
> +			}

Why does this run twice for the same index ?

---
bod
