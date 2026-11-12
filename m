Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794483635;
	b=XaoKfNcpdlNVUrVgqldckdPT6cnEPUVyMG2/+AMhx6Ez7AVoGjSb16Ph4qgzquyoZjta
	 Ct5TDxbWOmawhBtThaGcKj7gMiZUu7zvRwg6r7c0V1VBRhySJdTzf84tjKMa3rjh2fLwm
	 /rp5janUEASp6lokdTdFGhahzd+fTklvfp6wLaok0TD5tB0G7MgzeEBvO6dio6/XUbQUu
	 fvDk+MaDVaip/vCyZnLeVkek40wJuZS2Ml591iphvN6bGVAqgX7t+tcjjYtbYSd+b2yIn
	 lz5gxRGyQdu1/m4zVnznRz1YPFNqlTg/lchnILYXGlRQ4l2DxHKexBhlIkYNEM3cJ0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794483635;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=gsyHZxqCFC3P+dq4T8RF1a2PV5Q4RTtu+8pGfoK5wSY=;
	b=VCNsH7P6vDe45Rjp7JPg9OJWAXReAPT1SPCdkHiDJVYCQ49Dh7jWkHgyWRUlT0iK9m1o
	 B94WiTRauXmGRARObnZs5QcO8f5FfFF9cbK+6+krJh5+3OsaIObCX1whzQi8+F9mrCX7r
	 1KG/FnqEVQ3E4MR/d5xFrbp3YvQ8TZEtY+FCKRsqTVRRTSABqfQa67F/rOTcx9rvp/LWQ
	 f8MeNMFJHoD+aV+LSeWSE7UiYdkYyxdI++uswVg+161QGuoR3MEng6BHI6MdZVCryy15M
	 YdPgBDLExSw/uVRwj3DdrPKsbM5+3gEVXFG32reV9Zbg2IfLIjNtFNqH7Sa8M8sgQ1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tge4VMtg;
	arc=none smtp.remote-ip=74.125.82.180
Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A30E5606A321
	for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 11:40:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A30E5606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Tge4VMtg
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-36eb1cb7aabso6239965eec.0
        for <devicetree@vger.kernel.org>; Thu, 12 Nov 2026 03:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794483634; x=1795088434; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gsyHZxqCFC3P+dq4T8RF1a2PV5Q4RTtu+8pGfoK5wSY=;
        b=Tge4VMtgjclRf+pzqJS5ekHgrHrSCeLOgPSO3I999bp75xcBC8b3SPuoO4TVQt9GeY
         6Se59I35oN6hfE9b5PLhIee2YiKtCwceIWizMYngrlh7z9vW3d7YavPI8yX4AebaEZ0P
         fWAB8trYbj0Fflmm3fLqp5E7+zLtbrlg1qmk3/kXZmrz9LSvVdFexcJv5nGVaqC+1DdC
         N1yjB4y5etDTAi5yPr4dyF9bo1YYiLge3oXQeDooNIPtCXIFY8Nws3bpcE4aFuLbLBfd
         qXxh88iCWKoA2uwCJN3RKMRRZ3++I4a+COuyC9whueEG4CmGqfByH/mAk9dGAeIU1d63
         WqGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794483634; x=1795088434;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gsyHZxqCFC3P+dq4T8RF1a2PV5Q4RTtu+8pGfoK5wSY=;
        b=sFIrOxDesynSrZHL6HCK4mxfcoj3ZOIFMyX6UHUgNVPtbWTgoZftuJJjJfhdFwdwGN
         a1nYS4ZjPsXfloxtWV/ten8TWt79KVboKCkGMS48rfUXzKJlZ4EXDH3qbmBL8PiG8qwW
         Enb3K89bEpj6Zu1DI7F5O98fxMSF3fpY+z/xtMm3NSNviK2HPQPYKn8SSs0Vpr09G1KC
         qN0RGCw4rDHTEPcjzwI7SP+qTEAlb87CdEYzY62DtpV2eQFCJDNNvCFD1SgAYgGbIbT8
         CNzfJ+RSxfyAPe26SbyHJ47JzPF/dxHt7UO7PF6Ajr11dL3STTglkm8iXO8lYuKxu8ga
         pEkw==
X-Forwarded-Encrypted: i=1; AL+hErE5aO2zzlngiAraAYCpxVL3KY9PH2BkSi+IIWnTulcK1on/2ZVmCykrjO9zODbSQs3WhyS7iitjv8RB@vger.kernel.org
X-Gm-Message-State: APuU4Z+6bW0x8xLVDooqdn9O8mgg5rq3+28Y28SvV1IJppvJfgh0d648
	lnZ+MFJUoEr2OQMI1bhghUGTlt4yD2fIO5wLQi1LUj6wE8dyIug8t5sk
X-Gm-Gg: AYBFou0WjQumyVMZJreC+8cDHH2hSi+RYzoU2WgnsrzueJWSVVIfr9rxiqKIzqE2ypG
	qBZOfgC0NoukzPc4/Y95m/K2e15zaGHJrHDFpFnXyHhwPjRrfiVQhFjWGYZTdvdtCi6QWo7bbm2
	xRtit6xpw9BZAhtJiihAvK2BSxE2pE677moc3PV+K1vWNZM/rPc63dvbwOan+4y2IC8ceHb8ttn
	Q1yb9Re1cfhKczePF8nsY32LxgPn04QAq2zFq+ZuWbocOCdWo9gSW6JeKbcksaKDqsEPSdus8/p
	IiSDWWZwTiq+2oPiPfsV3kdt6Uo+dcRjNKjH3qhoKmcg4MOBeY81xnqWKJQlP/F5KrR+nqMezIV
	ISdVbQaA+SZbQKYUe4+pG9pERxOCVhOvG/+qesuwKxFsAdeDFBXM6O9oV056UVKlJIPSwIb4IRL
	FrlXOtCQnaBAPnpBjMJuIzulBQJv5CjRFvPBzCYPWl2fSXR5ku72JOrhqDQeI12gDEzrL8acg3H
	wKSt9CvwAtQh/J6jRw8QijduMDcvsaAcVk62Gk3A5B0VSSLl0DA9BPDaINLWTO2iy7CZgssIsi7
	NNs6EVMPoL0yF0B0ZmeaeqfMnKcWObmHajZbWcEEcg==
X-Received: by 2002:a05:693c:8344:b0:369:535f:4d12 with SMTP id 5a478bee46e88-37683188720mr4399109eec.3.1794483633595;
        Thu, 12 Nov 2026 03:40:33 -0800 (PST)
Received: from DESKTOP-NM9EKIA ([180.67.33.100])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3751fe306casm23450944eec.9.2026.11.12.03.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 03:40:33 -0800 (PST)
From: Joonhoe Kim <26rote@gmail.com>
To: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: gregkh@linuxfoundation.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	andersson@kernel.org,
	konradybcio@kernel.org,
	abel.vesa@oss.qualcomm.com,
	wesley.cheng@oss.qualcomm.com,
	krishna.kurapati@oss.qualcomm.com,
	konrad.dybcio@oss.qualcomm.com,
	dmitry.baryshkov@oss.qualcomm.com,
	neil.armstrong@linaro.org,
	val@packett.cool,
	balaji.kalkonda@oss.qualcomm.com,
	tvlad744@gmail.com,
	linux-arm-msm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] usb: dwc3: qcom: Keep USB 2.0 working in DisplayPort-only modes
Date: Thu, 12 Nov 2026 20:40:31 +0900
Message-ID: <20261112114031.126-1-26rote@gmail.com>
X-Mailer: git-send-email 2.55.0.windows.5
In-Reply-To: <avUU-99gu3YbNA0g@vbox>
References: <20261103135057.1682-1-26rote@gmail.com> <avUU-99gu3YbNA0g@vbox>
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Thu, Nov 12, 2026 at 01:23:30AM +0000, Thinh Nguyen wrote:
> Can you address Sashiko's review comments?

Yes. I replied to both reviews, and v3 addresses them:

- patch 2: https://lore.kernel.org/all/20261112113958.166-1-26rote@gmail.com/
- patch 3: https://lore.kernel.org/all/20261112114004.182-1-26rote@gmail.com/
- v3: https://lore.kernel.org/all/20261112113838.506-1-26rote@gmail.com/

Thanks,
Joonhoe Kim
