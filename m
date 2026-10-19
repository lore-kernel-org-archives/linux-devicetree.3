Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C1484A2A5F
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792400865; cv=none; b=WWMw0nLbt+w9FSL4rR25AnTGY8Y3CYVAJ0NArAwVvAvGM0UGqFqgG8ovQl9NRSfldeANL3OoPpuG7BFQoAwoUe8QBsbUmHUbsc9pY5yyNYRihGmJ3NXaAuBMhdXdwNxJtXydnVU5LQIUF0Z6d2NNTmnWVM8GsfWcZelP1v0celg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792400865; c=relaxed/simple;
	bh=XEbm8c7un/ubtexMiqmCilOU/M/0muLc3BE5N3+cOHY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=orFZAfBfuEojjPtu3faFUjA1LZhy5Pu9Of6O9Fu1DU6Yv+xAx1eHeCrGfqRZlLSQJ1RQKaFXgl34dKWJ2rA5Lc81BWX854sFSP+EPvQ/4X61zmuK2rv3+yPvOuKDmAGUXOIqf2zgxkdWM0ed14+Ec0SMCDsKbAnjqpfYJEbhg6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hOvs/ARo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dMM78dmd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hOvs/ARo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dMM78dmd"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69J8P5Ke2753872
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:07:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iZmkvBbYu+nGYKaGaPZphxwUHTgaluc4gb3c8H9QDSQ=; b=hOvs/ARo3bMlI9Vp
	klfDUgexlNsMYfJobkIfYmvLcK0xuYIGh20CxVreq9svF7xUc4+QmRsHd1kov+wW
	KY38iuAAS4wb8daIdU7Qz7SV8sBGZtjjCp/4gormxU3Wkfx3lT879CrJn4BOzhKe
	CGUTTaQflK0oiadZBaHKZlwGsCswV9d382k0ikKPvAI144RRS+OTwWKGIIaXHwRr
	OiXFLvBoqv4xTmk25v+qXWvbKmAkxWaLNY2F8xPEsDTk7XPvvmRWhGke+XdawqbU
	BtqxY1bcxWFUAm2mhp+ZDe4LLr9PdhUoOGzE/wmIOxZF7Qivq7SybtY/aUPbmvkf
	78QjEw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdf48g9ke-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 09:07:42 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ea8a9cfe6so77650085a.2
        for <devicetree@vger.kernel.org>; Mon, 19 Oct 2026 02:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792400862; x=1793005662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iZmkvBbYu+nGYKaGaPZphxwUHTgaluc4gb3c8H9QDSQ=;
        b=dMM78dmd77JUNZVt3+Hr4kwg2UDxXEqzzNGivwjXdCi/P7YnplB5R92mIe7D4Y+XCl
         Gr662vl9woVFg7KelHmSc20gKN09wxRIWR5G3lcQo3sjGSNG3A0P6tQPbDDbEwl+5g50
         ybjJdk+4cKSks35nwyd/xj8D/ohstTW2YMdfpaO46oqrhImIldyW5oBa6Hgzu2ZvUNxf
         L4wB/+YLU2PKeCTlUzUAO1Py0r+iivzXfkUfzuJ/4Bw++aBRQax1fUMVwXV5FOCP65xo
         4RTVDnY0EJnqkl93IpTMRqrfR2NR0hrwo8VLQvpjBeQpPITK662YbnU1ttl9D95q8exx
         zZag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792400862; x=1793005662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iZmkvBbYu+nGYKaGaPZphxwUHTgaluc4gb3c8H9QDSQ=;
        b=oSILomhH2ZJI/0OJP9OiOjGoU70IE78UgcIjFhrhO4J2pMFdW8Q9HjhVAHTCd1wtO8
         qZXUaThyr9eGysJ4JW7SJzNjIcVSjghVZm0ZADvQk2aawwfcaMw5hdz8j1egejDO6f7+
         yvbtUSlN+XjrRPqU9SGvhuP3iJq5RAu3QyotDPPRAzoqAhB1bIXRnzqBiAIzmbmRLUI1
         dCRDqaptHB9ylF6SBAvnRV6cTjGFAOmlV0pVKvPNvxkFvEokPTr4Ley34wiIFPizZ+Uh
         caBIhtNFrH60awZoOisjqaoPnfhGpt2WCEzY9kqxWcdVF1+5myuU0HhToHA0LJTynujt
         SHqA==
X-Forwarded-Encrypted: i=1; AKwUvBxolhgv9uGvU1+c8fRR2jg7HjkeFv6YLS2p/qevTiEfr3Xf71ngXtjBPj8ME1cvr+sf1zdyIfJeZrjo@vger.kernel.org
X-Gm-Message-State: AFq9FYLL3ULW5bhnUAlbjQ+MPKKHPVOkoFm2ZNTIoYJ6zW4BuGIel5Eh
	IlbuqA06Y9UfSJ0iBzF3ctujhn+Q9ABNqBRRT2QKON9xzv6kAAds7viW0pVpw1OKhgYSdGKtE2F
	GXt9+OK6iQ6tD3cKQf5ZR4x+tRudBABeRcXtlAT61N8nNsWj5IZLY64GLmxW9+XVt
X-Gm-Gg: AYBFou2wZjIAm9semGNUxY5o4qmKLTpHaOSDeoOmnadD9kOpXfwJtDGaaH9Yb0sbNhE
	KbqskDg291iosNZHw+JzTFZzrL7amcfRsoZQG2eOlaZQQkGRDnGnAtF+C12w/Nqp2VcHzD5jIz5
	NaNKTlGt58KpGZYqZWVGXBTya5ScJ30DxVvlh9rCp84ba8F5zAfVC6JIH+G9Q8H6cEX2KNdcaiK
	nDqkxZr2pU9DOtJ5ssIBcxNVjL+z/lJv2KQ9kooTMKk3msv2qegpSlgibWp0/JjilpzJXHHEWB7
	++V2Ceke0msl5UymeCOL18Kjj9QMICU0Hzvvpo6J8RYV6AyKa72kHgnttIC19jxMsWCt44pbx4q
	KOWAddlQz8Yt6p4SzbML7NA==
X-Received: by 2002:a05:620a:4402:b0:93e:508b:7800 with SMTP id af79cd13be357-93f29a21553mr1351060685a.0.1792400861882;
        Mon, 19 Oct 2026 02:07:41 -0700 (PDT)
X-Received: by 2002:a05:620a:4402:b0:93e:508b:7800 with SMTP id af79cd13be357-93f29a21553mr1351056585a.0.1792400861324;
        Mon, 19 Oct 2026 02:07:41 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c40919c03bbsm324440966b.64.2026.10.19.02.07.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 02:07:40 -0700 (PDT)
Message-ID: <d7acfaf2-f416-4e83-85c3-c30aa4e6111b@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 11:07:37 +0200
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: hawi: Set
 snps,resume-hs-terminations for USB controller
To: Peter Chen <peter.chen@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Udipto Goswami <udipto.goswami@oss.qualcomm.com>,
        Jack Pham <jack.pham@oss.qualcomm.com>,
        Pratham Pratap <pratham.pratap@oss.qualcomm.com>,
        Krishna Kurapati <krishna.kurapati@oss.qualcomm.com>,
        Thinh Nguyen <Thinh.Nguyen@synopsys.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261019021547.1694088-1-peter.chen@oss.qualcomm.com>
 <20261019021547.1694088-5-peter.chen@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261019021547.1694088-5-peter.chen@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX09PdzKih7A+l
 kamJYsWcS9rj5vnI+k7JxFsmGjTLK7ZUO/pdtXItWhoKiNongSxgpGQN59OCYOi3UQk2TmSDAFa
 RUl+9GjotjSiaelZCUP2900q4XKFXz5l3P97PK232mhKFg5npjlZZMFj7YtAw/CIu+Vq2PLa3qC
 vw+Wfy/7LFfduiFsJNARwZxg81HoN3/r/f5ct3uOJ/bTSSo3K37AFkDybIrKHtFU5ocGLX2tYdb
 AYKJHy/yhBhBFTcMGzZscxggsP4eAbUfNIiHPKl0+k2gjQVFKBLDG1wwXrEb23xftbTz2qlhpg6
 rYRKniVQoC+Au3zwIKGXnj2TaPlR0r2XG9KzCviH2Hbo5MUJqB1cXcdofyT+oAEJgqk8Gm1oP9h
 O4bLM8a2cQJhyNqRVRSEDcHGyRQpyu25sEPlsotvzB+ZDSAo7EerYp/k4HEM5Y6PEAlGvR7Uta3
 b9o9/vGRz0PW9PzaUkw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDAzNiBTYWx0ZWRfX57IwLc8BOGrj
 SIJeEaR+XWBLSuz2JBDcQbtWIylxNOB94OBaj1cWSM/ku4R3zE6pI0Q4pMap9MbTnbcedMMaQKz
 8ATkb/L+9UZ+t7SU5Brf4a1NJcpZPaQ=
X-Proofpoint-ORIG-GUID: Llv0slZmRcefJRCNzmL2htxNp4aJ_cwl
X-Authority-Analysis: v=2.4 cv=Qr/LTlyd c=1 sm=1 tr=0 ts=6ad5ddde cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=SFmIH4a4ZRYK_P-DvPgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: Llv0slZmRcefJRCNzmL2htxNp4aJ_cwl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_03,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610190036

On 10/19/26 4:15 AM, Peter Chen wrote:
> The DWC3 controller on Hawi is paired with the M31 eUSB2 PHY.
> According to HPG, host-mode USB2 L2/L1 resume with this PHY, GUCTL1[10]
> (RESUME_OPMODE_HS_HOST) must be set.
> 
> Set snps,resume-hs-terminations on the Hawi USB controller. This makes
> dwc3 core set GUCTL1[10].
> 
> Assisted-by: Claude:claude-opus-5-5
> Signed-off-by: Peter Chen <peter.chen@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
