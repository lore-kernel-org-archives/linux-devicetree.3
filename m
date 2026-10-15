Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E15E9503BD8
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:48:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792057718; cv=none; b=kXrn1AFG3WE3MeAeBAPtFYGZdbQjJpFMonSp7GfGsMjlBg3E8woY4xnOYFOXafd5OUNCt+dDLH5wREgtCQXGq/M2+Kl97X8wu/+x1kSa/QCuFp7l2ReH0q3k4GJVlWnIZ/TArSPiZ8HfVJUWOcbBxYATNAsfZiRlU9ClS3oZaP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792057718; c=relaxed/simple;
	bh=mu3+8mK8bt/N7Vf81iCNfZXtMLQtZd9goZa/42x+XVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Kh9o7C4wT8qHkhOeuFrhyuNI1KITFnuU9fwZ/uAg5SQ42tqD0LDaaK46ganaQmMNmYLaQM4pRPK2JzKxC5SHyfztjr8rAKpmSw8VgPRUV5r6RvRj8F/lxbgqN9rDD/gbn7mOcCu1mvsXI4n9SM0TgHwq8ZziE39PNMl/r2/kf9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PYQ2LI9a; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TbiGrcw/; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PYQ2LI9a";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TbiGrcw/"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69F9jpU73408901
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:48:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m3KAG7YDGqOBR2D8Zn+sxc9jTExC3PMBl+koNYY0A4Q=; b=PYQ2LI9aj27depOZ
	qeweAXNBoA1cgejsFBYuNOalTEdQi3dhHBovBh4X5s67yygNgxEewsmXMGVxJwUJ
	xknMYhgUc0U7Sl1gvwmfoSE5dAGNJJuDkn+GDtdTh7un98iVQ654iXublSoIG3Sg
	f8/PFJQdbcAqm40e55coyKkeZVOK6GRgywvAcUQXGRBcvkXlnuBLxfiHkaHOdsz1
	wmwCWbaM+/YW1xU8d9Nq/H2ax0JHCw5413mffdzYSGHYgbysfsd7RDtp7UYVhM9L
	wNHziNWZ6WJxj9qi4gJBZqjatGt/8HL8VCV/ZVmkfN3Qytu6KTQuq4NVby86xgfi
	1zT+xg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hakwn246j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 09:48:34 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-533758f24f4so13287031cf.1
        for <devicetree@vger.kernel.org>; Thu, 15 Oct 2026 02:48:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792057714; x=1792662514; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m3KAG7YDGqOBR2D8Zn+sxc9jTExC3PMBl+koNYY0A4Q=;
        b=TbiGrcw/LYd0JoqGg8EGOu0mGbBag4NQ/vtfhXszWqwmpZp7n/8B5eCQHzwYdnYi2R
         8F1IVCE7JG3Xb3rAzTDUxHsNOGImrPw3QUQdFNcfDWZXtdu6tgeE8vprNv6pNBbYQal4
         s7fDHimnE5xbyA/WBzX2aWXdjlNvkPD8tw4TgdW6nz8pNm3LybwYOb4x0UwXU82duNbu
         UIzoFaKbYoKnnbhwoUKVhq2X3ipn03nKMG7MW9KZwS/fBqwhbCVtgO5aqy5sDJgTvtDM
         Z3FHPDX/dTvsQucGNKbkTzsO1CmtCLY6mzFOjHPHGb1vnbIWdnUdbU2DhLfPzNh0yPWf
         P16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792057714; x=1792662514;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m3KAG7YDGqOBR2D8Zn+sxc9jTExC3PMBl+koNYY0A4Q=;
        b=VsNL4efGulHE7NU4hGfb4Op2QbevCVENsgV25HD7rBqc0QF8nZA6AivABjPCS4wa5k
         2sye9lV8CImoa29QjJS4w/5uPgJbl7Asjp2toOaR1CRQcJ6mMU3ktYPuyKWge+PvbXoc
         pqEBBjxskD590UKkZfY6K+rD10h7Mrw1Y2TZEGWlBqYE7hANlbV3HQ7vYW9tuA3hppUQ
         RxabLVgpoh8xLd7akahGeD8IShTc2qtuMBMz5pBLtFmewbvcyIbM11G05y43m29jBa53
         kdxU/nvJNUTUkmDJCZUQP3bnHRYCKUSo5lVXi1JBs3DJBSX+ZXZzU0IvhPnnzQXwj0Ly
         Sfrg==
X-Forwarded-Encrypted: i=1; AKwUvBxYWWby4jJ9oDI5G0lpsINUqJh65w598w431FnbSmbksXoTwGcvRikXiaK2LNBMxtJWdBcH1nWT0h8+@vger.kernel.org
X-Gm-Message-State: AFq9FYIMPcbwoZk44VxH3NDsD8p9GqwgTC7bV9M46Jn2G/wL/C1yn6Cb
	HH2BHoEsUZDTBn01RjZ93Z2hxguueacmyYA4TsWru4jV22XVdnnDQ0PMNiIwt7GTrhtCdzgdZxp
	KoEgkRD2+g8AxQ6eK/aYihTiftiran47W1OxV0+81Mpv8t0eni7X5urWY58t0WfhF
X-Gm-Gg: AYBFou0pMIST+M2IxD1UFeoxzgnn8bpa4r4esTCaaYOsOR+U5xVXkUrEi2uLdFNaTmk
	cUFtYAZvF8oQPtzH2FgCsrgR6ophuMajnj6bBdm5cy8nxb3JdkwyZ+YFmZX+aKll4CBj/f/PvCJ
	LU8FUZ+npMoTEUd1OrQ4hSXcS6IFCL036E2Qi6nC6lTfYhdTXZNXMzK8/0o4XUY0uB0kK46npKg
	FwygGVT4vap2kMWdHIW9xTtj5ZkOBptH76oT3HP7ZWkMQTPD3GehkxW9q0CgcuM2mhwjDpXpfQj
	S0aQ2UUjWcqJ/PiaMbbsXb2fZXBqn7hCw4uVYwmFo3wJ6WUZ+IdMpUcYQug+qtc6R+9eD1UGk7q
	xuKptqUCZMA+UFriKC7hoTQ==
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr356797811cf.0.1792057714037;
        Thu, 15 Oct 2026 02:48:34 -0700 (PDT)
X-Received: by 2002:a05:622a:507:b0:532:d67e:bc2e with SMTP id d75a77b69052e-5359f0634femr356797601cf.0.1792057713501;
        Thu, 15 Oct 2026 02:48:33 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda622246sm102601366b.70.2026.10.15.02.48.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Oct 2026 02:48:32 -0700 (PDT)
Message-ID: <812d0272-db2a-4dd4-8e6c-e66145af2db5@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 11:48:29 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] arm64: dts: qcom: Use DP AltMode defines
To: Sebastian Reichel <sre@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-mediatek@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, kernel@collabora.com,
        Sebastian Reichel <sebastian.reichel@collabora.com>
References: <20261014-dp-altmode-dt-defines-v1-0-b657c9b6e4c3@collabora.com>
 <20261014-dp-altmode-dt-defines-v1-4-b657c9b6e4c3@collabora.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261014-dp-altmode-dt-defines-v1-4-b657c9b6e4c3@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX5HUt5j5FqFaM
 30IXfd1ylpjh8ZFcZWyWf7yfyQYEIMjkwZQmlzSwsoZ6zfd5RWLEKYtqAb5YIwRTEfXhbytmtYo
 9lSVgeHcEbNNz6zIMSda8QrT+zfoJ/hKoscle+03AZvHnZ7Y0yQ3WphZuSw9p68mqjFm1P9v6Ls
 D3bXHeDMUSFwUQ+TV8buU4rveiIpwBEW6BUVxSLJd36NIEfeXmC4XRfQvVUacc1kgtJt3ISWBe2
 b1v2horJ2CmCf3Yiyi4jKdyuVL9AKQM3hvszSCMGdmnvpnSj/2GJ54DcFiJwKB1+MsuX91fuLcv
 /yYN0BZdD2H1Wjd1+cEYjcMAGhGvhFeogs/Fdqfx/FP3CR/CXbbZ0lwxNwyHLl6+yXYyvWtsCOf
 0E+d1iommDrOVYwU4ZudAf2NXpHi5B9brzSc4TQEUI66PECwAP+2pE7wUfl/WxjxfjXDfaO1vE9
 ZX4I254Y9+nu2YmvVPA==
X-Proofpoint-GUID: _4_poBy2xGjtWdV0BNRDKU5PclCa_V8q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDAzOCBTYWx0ZWRfX6vNeiOl1Y/45
 PD4ytc5iwLE2jhIMBe39UidPdCwb6d4FdB9tFqyIprjKbJjMgjqpPS1LfdtoppyLAeEzoK5E8jr
 qkpdq8SM8+VuyxQH2BXWJnVptBnmvVw=
X-Authority-Analysis: v=2.4 cv=BqUIUoX5 c=1 sm=1 tr=0 ts=6ad0a172 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=QX4gbG5DAAAA:8 a=EUspDBNiAAAA:8 a=C_hJBzH1aKR8969NbtkA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22 a=AbAUZ8qAyYyZVLSsDulk:22
X-Proofpoint-ORIG-GUID: _4_poBy2xGjtWdV0BNRDKU5PclCa_V8q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 clxscore=1015 malwarescore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610150038

On 10/14/26 11:31 PM, Sebastian Reichel wrote:
> From: Sebastian Reichel <sebastian.reichel@collabora.com>
> 
> Use the new USB-C DP AltMode defines for the SVID and the capabilities
> VDO to make the DTs more readable.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
