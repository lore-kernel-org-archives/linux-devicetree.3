Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795170520;
	b=oiFKK6sOZ3L7CjnpGqMsMf6j6rZReIajng/9xi3tcTCX0cds/1FK7+UJoAJ8U+r9enF6
	 2/VQoBbBebsucn8at0F+flMSys47zNAdijlz0ry4OdnACmiPY5aG8OcVhk9r7x8NNg3N7
	 tnNhR1lZFBGGuSPobScJmNeTv55qmTXCZOfMgFD075aeeC/iqxdAejPrFwmbnPSgKbJjc
	 DzW1XKAi5AziBEoXOVHfcsXVIv5WcTbDyKHx7wmkBjYGoyptdQbd8xs21d5OoI1OIs+Y/
	 vLgzjFAwCKQ/8Qc1QR8hEqOD67MeKLUrgoNd1g6eLstP1LZq/mUA2A5J7MmEarr6jVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795170520;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=G581ycX6Ku6kP8YxR7osG1LQa9jb2ypNNxCsAk8tyrw=;
	b=j8ZvHQebzgyXw5I5p8l2BmSbXG7vjJurBfHu/rvCwhdy/wtDQlnSzczfFzZ5GHDVPLIA
	 C19REjZg4xqBPlmFjU+JtNUEdmXWufW/r6mQc3nYBVYvQyR0s1iNaINTQYVq+C9JUA9pR
	 v+QncThTKYf9x+jSrl+KPlqwH9H2TV5UnvBjX8CHdmjTwWCpqSeHgp7XM1460F2oT01NP
	 gG0TLK1b2pQQol5bO4x9C8ZTZUDLdkCowciA0Ln7e+92NwBzNe8/rAApxOGAn7p2l8GG+
	 0bQXAjqmJnMqlqIzz6XTetxKqC83mN95LeKPg5ZOkO4FRohCEdLFvG53ww7KFiY/5ow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IJfDmle0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KtRM+F+r;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2CD460A2603
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:28:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B2CD460A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IJfDmle0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KtRM+F+r
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AK7fLWV3576543
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:28:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G581ycX6Ku6kP8YxR7osG1LQa9jb2ypNNxCsAk8tyrw=; b=IJfDmle04u+tTfV6
	e2/yVasOZYYnS513Wd2IDyWdMIi23/8unEsh6HXrFWnKKFZClyi3xLH3/WgQ77of
	QzsBms+5uwZVvfhcKJPg2wDlPHQPfivH7i+MAvKitfV2UTb1GMwhrKZCDFHzeIl1
	pLkqhOgm7sXNgKO7C4l6VTM54eEbPcYzjPCXQvToDADnzqvf5JgU5R8tTv1uu9ri
	4PdsXHUeI7vo6E7LZQ6bLvcWuL+K+Pr2a/t0JbAATk5PZO+6lzN99ZVFNu/3cj/k
	aHb3mKexVxbKysHb0qhCwiM6lU6/MnHaL9R3IAZn3LrzCYp22n9ELeYBb6ubA9fn
	ywgnxw==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2gu80yd2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 10:28:38 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-384c78aa0dbso928401eec.0
        for <devicetree@vger.kernel.org>; Fri, 20 Nov 2026 02:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795170518; x=1795775318; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G581ycX6Ku6kP8YxR7osG1LQa9jb2ypNNxCsAk8tyrw=;
        b=KtRM+F+r2STkugosvgSpV8uue1bGGC9T0NXWgHBw2q24FE9lszZ89639mjR/OKGTPO
         mHs+48S6E3YSAqh1fX756i3cFb0GOUH6/AoKwq2NPB3wOdc4dOHSsjNkkQ6EviPqgiyG
         MAIOl1P5ymKWrgGQ3abF1TZNjXNA4uZ43c/0bOLVHx5zyIodbyAhjTGk+BxE+bgnZ4Gz
         esSE5MeF8xU2mRdb+g1l+qyT5h5zP4doNRi6dpnYAd+4yjaxwYbcZSpkzuv8lSLMcvDu
         0cX1yFuLHnw+JrvkyUESihXELmo4M3RMZ4tHEbsntf7t2KI3tpYT+7VZkor1JTq8Zanb
         PT8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795170518; x=1795775318;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G581ycX6Ku6kP8YxR7osG1LQa9jb2ypNNxCsAk8tyrw=;
        b=aK0RBvXZCqCKTFU5iCczmNQEoVjvSAiaJ5B3oL1oeniKTTlV4dgHN4T2167WcVIh+5
         cF5+FnbI4uevV660XYS+hQIwnkJlH1S8GyJViRefBTRWBPUsfJAZIP9W9yeC7Hie8rLW
         j2kS08pJfb/kqKNaTJ5/hbEXBvhglq7PSAifs1f+u9ymsH0hl77Tqo0+bJ6twTX/gJMN
         dK9loKpo+wjywWQr6H+M4tB5v042Vo72CHc1BOgKT095OMcgNoHcxRbS4GN4wtIZS7bL
         Xr4pAWHeiyN2y0WWZi6D46yPjwbs6HeM/YMTJMgzi2WX3v8hgKVuWBiXdfFVL9IfeS1I
         yBXg==
X-Forwarded-Encrypted: i=1; AL+hErEmO2WL5DntBiksqhXcphGjcW6WQbQlXpEm23G8gMngzHZBeoMGfCCrilcCz2ZseHEMYlqDIDdKLD8R@vger.kernel.org
X-Gm-Message-State: APuU4Z/ZFLCW8IDs81EVDzjVhJeKdLB1KxXcVp/zXDL79hdyRENFgfRw
	ojlHgrD7UwqX27G5UuucIiQryqKC7fXgGRbFpP1GwdpHRcMfF7/J+YCEZnWqHboKz7Bn4lX85i/
	nMeEO1fPcxMOsVTmrpQm24vg0rhfI8dYOIxCqXeSNAd+r9e238ynSk1005mDC9O8u
X-Gm-Gg: AZFdTZcCBWcJjClKErMmxD/3+6Gpg025Qal8Qi5euLVfdWOqFi5TAApyoj2TbgykNjE
	r5XQ5tMsiChqjwwsL2c0KOoFbTBwl/Ixdfb4CgEqfArXPQg8OFRym5FMYPLCjOWGjz/s9VY8mdl
	H9G8ZSfd+Qwxt2eQFcHdkzCLQigvtZ33fGfbvd5ShXL7QxxbLdQ/zc0CZj3ZNexbnxWi2V2iF0A
	+rhjyvg1t6eV49gjJnQr6TUciPBiQOPZvFHSTqsJc8fAWk5VHgoMe/r4CnHlPUoi60jGZlDAxlG
	Nda4sqadp6/xT+Xs2SL18umIy8XSDmbiSaIARBIP93nstYojnYXXEpv+XHK+LtXfmCPUHOvVWcv
	YRZf9FFUxJyz/D4UDPcqU/fZJs8y11tZnArxgv2XT9+1ayZ1yNDfGDbs2MirgFJoeQMoZwTjy0O
	mYrg==
X-Received: by 2002:a05:7301:4c84:b0:36e:371:8255 with SMTP id 5a478bee46e88-38569944070mr2039966eec.0.1795170518231;
        Fri, 20 Nov 2026 02:28:38 -0800 (PST)
X-Received: by 2002:a05:7301:4c84:b0:36e:371:8255 with SMTP id 5a478bee46e88-38569944070mr2039930eec.0.1795170517779;
        Fri, 20 Nov 2026 02:28:37 -0800 (PST)
Received: from [10.217.216.70] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd46c5sm8572641eec.11.2026.11.20.02.28.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 02:28:37 -0800 (PST)
Message-ID: <057574d3-b5d3-4617-b9d0-1c68d6fadc5f@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 15:58:18 +0530
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
Subject: Re: [PATCH 2/2] clk: qcom: gcc-shikra: add PWM XO512 source clock
To: Taniya Das <taniya.das@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
        Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: Ajit Pandey <ajit.pandey@oss.qualcomm.com>,
        Jagadeesh Kona <jagadeesh.kona@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116-pwm_clocks_shikra-v1-0-55fc11501821@oss.qualcomm.com>
 <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
Content-Language: en-US
From: Imran Shaik <imran.shaik@oss.qualcomm.com>
In-Reply-To: <20261116-pwm_clocks_shikra-v1-2-55fc11501821@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX+sodxMaBkSzn
 qACNmAZ9p8b2nEn8tePS2r7JVNYJBMhFzxWdY0UI2NhATbsK27VSK7CsM73PExXsU4WGwXZIEWj
 gSTzzIJmZnhv8XAWwdR8d5gLxb1lvrlDiqu/+apiAm9kUSphzhCc9nzuRNML7MmapLuXKBuDyOd
 E6mtspWnjZAqLOJNL840Zs9ooeD0R1ZSXmZ3PUCfjc/XmJFle3irTgU27SzL+HaxqFW91xZokUC
 niuYykLT9FtG/o7MwesdeyjG+6qUV5pSXQrEWKOrY/bs12qsgxDsXjX27VIjnDtje0zX+zYWxwm
 YPmlJiFrz+nq6EmiT4SRfLkCo+ERpUvSU0GljNrbY+oNR56eNoUN/BjO1WBi8HD9Ctf6yPNzN6O
 uuk73g/bamu/mfM6Qxd8dJBHqv2JOCTLSzC0n1zcr0OA0zsBjlvJORi7g1BiEMk3WRyHYem4YXT
 kmdfdKLPzoYzD0EHKPg==
X-Authority-Analysis: v=2.4 cv=bLeDs/+Z c=1 sm=1 tr=0 ts=6b0020d6 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qo5-9WyrHJ9SuE11QxkA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-ORIG-GUID: dSXM9XfV5Lt9Jn_K57idWoRXA7EwKRDx
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0MSBTYWx0ZWRfX8tw2BouMDHeS
 cECSL4tx7alZrWKx99fIxUdpAjgnzfa5IlM8g2lwFvWzoE5Nb/I8eueGg7X0/+SlwTU23lxv4xe
 95U7hv07g1NW+3nACzYuujcZGt+X4jg=
X-Proofpoint-GUID: dSXM9XfV5Lt9Jn_K57idWoRXA7EwKRDx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 suspectscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200041



On 16-11-2026 10:57 am, Taniya Das wrote:
> Add the programmable PWM XO512 divider sourced from bi_tcxo and make
> GCC_PWM0_XO512_CLK its child. This permits PWM consumers to select their
> PWM core rate through the common clock framework.
> 
> Signed-off-by: Taniya Das<taniya.das@oss.qualcomm.com>
> ---
>   drivers/clk/qcom/gcc-shikra.c | 21 +++++++++++++++++++++
>   1 file changed, 21 insertions(+)


Reviewed-by: Imran Shaik <imran.shaik@oss.qualcomm.com>

Thanks,
Imran
