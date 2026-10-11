Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5964426D09
	for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 08:56:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791708995; cv=none; b=clRBEEu43Z5icIJ65BB1aYE21Unr6D0X8NKjcD+ZC7yKjzMCnqhmBfSWGr0djHgY3gV5JsfhLkoKOJuhJtHsGekqSSdAoa5pMRf3PFmNJI0TWZ7xuh42giosKymsFBXz0T3jhmFye1gjM7qKqCiUuitDr4fGOB+GfvK0TUzH4lE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791708995; c=relaxed/simple;
	bh=trXuCyofDSoyesvjUgDrKmbXdt/YLOeYazvd/Osj+lQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eirA1mQXsl3kwKS8LhowpEuf7Ivgg0D14PUXBigr2/bY5/98lg+H1M7aiMy/UuhS/xBYIVUc6pbAs+pbxtHWXZodnSTVWg8gZ8EKdwmXnxNnnT4OmhJQKtHgy93cGiqJTO1cxzlouagUyHSUXM/MrKZODeHrL7AZfGDzIE0DW4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=HCf+9AJj; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="HCf+9AJj"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6af9a90e4bbso1002297a12.0
        for <devicetree@vger.kernel.org>; Sun, 11 Oct 2026 01:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1791708991; x=1792313791; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dKOqZxKxSOHNw25+e85CqVx4B1361RF8kK92P+D5pVQ=;
        b=HCf+9AJj68FQjIxYxllcXMPh/xLWNhDxiwo2416kSNqHz9iEkEonTNZ0QTH+Yt+uWg
         +vJGQ4ibw2DaCwgZaaBa822cYfUtKvqeK9yPyjgXlGRvkCsqD2kHCUJc46s+qrWAeW9s
         x0CI+g+36a+2AANQEActK1Zog4eQuF+G9vtYFogZZnob3kMx2EzHaHQ+dVwT2NmurOBI
         Mf9FhnqzJHXeY3Y7TTnqbwWE/lSmHy91caoz52tlv5uo8QjI2autT/HQ5qF3UTdLoZOb
         bCLBrRViqKctlHnPtoO3R3qJiYsz+Uqbox3IpsXQFHlrFt+anLfctQCEtIs608+sxEU8
         Kkrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791708991; x=1792313791;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dKOqZxKxSOHNw25+e85CqVx4B1361RF8kK92P+D5pVQ=;
        b=ePFdhcU8gIvP6xTSyn//cZ3iSwCm/t9KWRV0frjV0gYxdvNcNijrx6WlghEmVZEurN
         Bv+abDKNa7fyp/X41OB+LF8o0RSPAY2pvTXNGJz5JWwmSd9Bc8GXTuxt9YabtD7IjTXn
         qYSNtf1A7IrUVaMKoX1pUPGZCCf6tz9Vko4duvtKIug1BefF38TCmIJ/vudyORk+2v2c
         kk8VQ6LNw87HvtCs0Qb2Z8XQln8+wXoOOK8lb1XZH8xdOH608Wk8sKZYK117GOApkGJg
         jgModJtqZ0n+gPoGn3bWDYMJxb+ti6mMRE1kZpApPt24y1TifDCi+wIdq78+0TBmY3BZ
         aRTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzMZiptCbMRZ6QHz+oIKuqgj/LZ22Sc2WVVrcvl10xnPtDPIIVuM0bgeTD1qwry2JFQNCfPfuXipIIg@vger.kernel.org
X-Gm-Message-State: AFq9FYIZcpQEkqZnz/eSv+JT/75nzEO7pueCZ4wDdkckaEqujnT+TlHs
	o/iPeUo9tR+TJU9DZqIc7hG1NNapODT9OFgHwOdgicjjkACOoTQDaeKnzIIAGp0pE/Y=
X-Gm-Gg: AYBFou0MKd7sE31fOZfVJN1kKeHipRa7+LmrQOGT09CEZL10rzDkhLyH0w3kqhTafzz
	tIGcLaxgHRhKZXU8Ei8YgWrF7dN7Jtolo3Btad585kNlN5zUwRXy3RXbfg0h4AO2mC6qYO7EuFI
	HGKYlRAKISQ0QzEEsDudiXYw3q2D2br0ffCCVyRQMRpy/KdqVeNmDmgO7co3CqvicYYmgoaskjm
	eaZr30zQEkjgyxUCzoTaq+VF0b0njoAfNZnElC1mJGRv1bMfVXEhPwNOHh0O+rK7m7BTcEyy59d
	5UEOX5uh+YYiZBiG9rGpfWBlaiM2Qo/x3LC2CaH42Y63rjRcLQJY+Z9p2R+4UqlnEW8urgXbeox
	zCeqTtK6pXPJEzjbbI5YC9Id2kd1qwhAFsT5KeTvj0laWzLEoQ/QlMzXFIEGTg/7zxE01LlmSw9
	wxjbNO7AwWzifPYzz2S5/oG5jbnz0J9wytEHWyGICGYVudbpgjGR/sXHnbibm337BAyc4s7Naw4
	l96j10Z2Xpf
X-Received: by 2002:a17:907:940b:b0:c2a:ef15:2be0 with SMTP id a640c23a62f3a-c31a9ffee01mr693409466b.24.1791708991035;
        Sun, 11 Oct 2026 01:56:31 -0700 (PDT)
Received: from [192.168.0.167] ([109.76.165.237])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9ae59f9sm334413466b.80.2026.10.11.01.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 11 Oct 2026 01:56:30 -0700 (PDT)
Message-ID: <a6e5dc34-c2e7-4a3c-a0e4-fb0a3a28cece@linaro.org>
Date: Sun, 11 Oct 2026 09:56:28 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v20 08/13] media: qcom: camss: vfe: Add support for VFE
 1080
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
 Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, jeyaprakash.soundrapandian@oss.qualcomm.com,
 Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
 Atiya Kailany <atiya.kailany@oss.qualcomm.com>
References: <20261010-kaanapali-camss-v20-0-63e98ce9ac0c@oss.qualcomm.com>
 <20261010-kaanapali-camss-v20-8-63e98ce9ac0c@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261010-kaanapali-camss-v20-8-63e98ce9ac0c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/10/2026 17:01, Hangxiang Ma wrote:
> +		if (!vfe->res->reg_update_after_csid_config)
> +			ops->reg_update(vfe, line->id);

So I'd prefer to have a discussion about if we can move all of the 
updates to one method.

i.e. why should any of the updates happen before csid ?

Sure vfe 1080's documentation makes some sort of explicit statement 
about an update that has been implied for some time.

My question is why not gate all of the updates this way and make this 
not a flag but a global behaviour ?

---
bod
