Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571868;
	b=OXT74QDnoHS3gEEw1lefrK4FIJJnVrXi0hFDLp0YOEbPU3OAZj6ngnRKCJeD07wOcvnr
	 /gqjHsfje5fI7+rbpThcysBkZfcLragRyCmFgcr5LumepQ0aF6/uSmg0rMbRrjmKEL9Ns
	 81Ki0hYNcSCvk8dIk/GjIl/GrMIcOQ++3jA5JDHQ8EZz+vyvrJL8S3FstGcZbKXz+EVjv
	 zo/1IF0IxXQon/DRQVtb/PG2PSdefN2ZApl61hBDwjtww9pvKpbZMbkrS2/F3/cN4Pwfm
	 xhf5yU0Lfh0u7dcQhDg3oMEbCzM9VVZ660JcmXcVCmX7AYSiF3Ye/U+ezbTcD0soNFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=;
	b=jAiOLZdHmuR8a3Q2f0xnOUnY4+EGOxytEYpNyp2+xLORfTkd8hopq9A0P60iJFMyh+FD
	 td3YO2fhZx+teWFYpwe8tM42+5GJ3EPFdGUqVov7qT+jarEcZ3Cl3FSs88mGjhvcW6hbr
	 MyrFI3G1Ws+wUOYCi31QQdRp3d/4cBpu2U4Hm+yzOsuVio3hwveTxEsIQa4/oxmCYOqq1
	 iwNh4ryrsWH9u4eOJFOEsCsLVuNtp2ayo1n+906T3uaHuD69KLBRDo0EWYG9O6wKSHsmF
	 FlaLlXSKKEAhHCuBtEN55TKXXtF76L216MYIx1SPLefaU1xD4wmY5IBPSNDhYfuKrrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TEFiQ7Cg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="gmBZxwg/";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A46606A31C
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:11:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 33A46606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TEFiQ7Cg;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gmBZxwg/
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADC0lrA632146
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:11:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=; b=TEFiQ7CgOeSRnQW/
	Se5AoZ7dU6cjjcaKCcUCdHvC6glfYOpUgtIi46FqA8lPXUVJgojFjfTr5Twfu4Mp
	CQbbN6g6pHf3PwdXgHahKEHyyYCJvFy3uK1ZrPlHyfhXCDZPXP7l2zI3/X6YRhr9
	P4cuWfILX/CScAZSIlXC+90djbPnxUYlMfurTNDWM2n9N5nRSr3Zm+vlX3pnFWhZ
	As8+Ov7kfmMtzFJB0joQo73uFu88E+LeiTT/JhxBaznhr2QHYE+waIvCpoMzvaU1
	mUm3VHg+zCXtMTkhyvJzq0nOEheAZ9Jegsrr/fM1r+Ndg83P6CJP2LKdzamirrDX
	+ZsSTg==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com [209.85.221.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwqufj7pj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 12:11:07 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id 71dfb90a1353d-5ecf0967947so52037e0c.1
        for <devicetree@vger.kernel.org>; Fri, 13 Nov 2026 04:11:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794571862; x=1795176662; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=;
        b=gmBZxwg/XbqtrqP2oY5LPz0tR+Xlsf3EK8DvNSJ1rLx9AofPyhzm2VQVvXVe4JZBqx
         OxgSJOVwbJ0o5JaQMKSlltQMxvdvq4J/n21qNljvslQMWk621bEdPn8ttOu+Lbe3UH7d
         +3xKZVHZ/L43kTKUZJ2vU/LUqd+LJrcYZ+SxgNovrNfnrwkRs3rK4WZG2ml2tSK5p+iq
         iecQvJEjCJPeJ+s9iggi4m4wOyMTontB8DhfUyM5I9auPFyujfzSGzZEMHi2FujjyKVi
         VR5uXP6/MOfEY/p8Twe3ZB/IMLUoBomk0ofKmSVtF3tp5YjlI/roFhNUgEOHp0CHwICf
         Sd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794571862; x=1795176662;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/NqXXavtqWESRvkrCUGDpDtfe0DY5TPqAKh7ZVcfS7g=;
        b=xkl5RAP+k1eaTA7gstZDPeDoom7kSaZCOfDRd/K12u5+q9ezn5v21DVQaj3Fc5oqRS
         2FcqMfV6ej2YxEZgmSA+Sepcz7C2seyAoQduTra6SVNsiGWDlp9iT9+x+7b1sxdwZuX2
         ZqNb2TrXqLAJh4UmmuWM8Uwk6LnEUVZNnTyxD57JU2b2S+MnFzCYQhD3YKryoiP22hU5
         9X/An4SZYirWQ9wUi//ium8uRqXJWdU30hc1OW935VY+4B4XDLYTsCC+oJfZRY242+ot
         1JNLlj0hzLusqva63L75DlY/gyptL2iESxROkHr/exw6S5jQ8kHD+jmcD4Um/9GPQ6AI
         3Clw==
X-Forwarded-Encrypted: i=1; AL+hErGhcxgkkvu4DaLpR/1ClLoMfj5hNPc4R4LD4+NosbxlEe9jyhGNmJGyOQ+++OYH5JJFkhk3HDjS9jRv@vger.kernel.org
X-Gm-Message-State: APuU4Z+CO4sGC8MgBNpkiP6o2XxZPzkvyIh6xlH/ZhnXIxSrWx/2UNkb
	gyfqGAFm1Uu93GF/0BIX2OO7o4e625bYMu6+flsTWEdM+8dZEuUF48ics6jAK4pzRRclk4Gfb4w
	dt2NXVmv3BT7Klr/vOnQ7kdD6bZ9toI//jF1w1OfyiShGaCQhBX0Z7r0i7jCDIiYH
X-Gm-Gg: AYBFou1IALg/O138w9dcPlAo64U8Z8DO9Q0COw33dFKtmdcOmGdr9ZQ5EOzD6WcVUTJ
	MdMQkFoykz/vptc1mymN5y3bgvLIK2NTjLeFyKhogdcfdUxz7PCr56mwv2ujV1alt5RD6o4J+ot
	yBdt7AF3+upjuWFLdDbM2NzF4wvz5aUVYdwOBBYB/JCKugRJvGfYv2FfXkg//pSXu2QdYn9Dsh/
	telbh3OqwLABlaLYRHkYixy0D5DIbS99A/xhq/5LYvA6Pk/Aaz6GgArdlPfUfyCNyHE7Lz79/jg
	5J3ElrGeEchEMrY31tsuCjKoZAr6FrZXCSjT8SmoeppIqZkEXZlXsFm1uV+PXx8a2LWdVQ12zrZ
	3mYfjvorWUiwjzVI9UYxMYTmjxUOmrPMgWOkPyyCIAiJoPX+/SjQr2LMDwYk10fAxAjKqx54=
X-Received: by 2002:a05:6122:6c09:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ee346b6663mr738739e0c.2.1794571861730;
        Fri, 13 Nov 2026 04:11:01 -0800 (PST)
X-Received: by 2002:a05:6122:6c09:b0:5ec:abdc:bb72 with SMTP id 71dfb90a1353d-5ee346b6663mr738699e0c.2.1794571861279;
        Fri, 13 Nov 2026 04:11:01 -0800 (PST)
Received: from [192.168.226.72] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095b56df7sm86814566b.47.2026.11.13.04.10.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 04:11:00 -0800 (PST)
Message-ID: <03d75b49-dea4-4736-a662-27ef64682157@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 13:10:53 +0100
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
Subject: Re: [PATCH 17/17] arm64: dts: qcom: Add Samsung Galaxy XR
To: Stanislav Aleksandrov <lightofmysoul@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Robert Marko <robimarko@gmail.com>,
        Guru Das Srinagesh <linux@gurudas.dev>,
        Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
        Lee Jones <lee@kernel.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wesley Cheng <wesley.cheng@oss.qualcomm.com>,
        Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Alim Akhtar <alim.akhtar@samsung.com>,
        Bart Van Assche <bvanassche@acm.org>, Bean Huo <beanhuo@micron.com>,
        Stanley Jhu <stanleyjhu@google.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Thara Gopinath <thara.gopinath@gmail.com>,
        Daniel Lezcano <daniel.lezcano@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
        Georgi Djakov <djakov@kernel.org>,
        Sibi Sankar <sibi.sankar@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, mfd@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-scsi@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-pm@vger.kernel.org
References: <20261109-halliday-dts-v1-0-289114ab8197@gmail.com>
 <20261109-halliday-dts-v1-17-289114ab8197@gmail.com>
 <3ddaacfd-59c0-4d87-9b8c-2caa85143393@oss.qualcomm.com>
 <20261109170407.2073295-1-lightofmysoul@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20261109170407.2073295-1-lightofmysoul@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: P2yHvS5NoV9LtHWd-7TopoXEtEgHYIJZ
X-Proofpoint-ORIG-GUID: P2yHvS5NoV9LtHWd-7TopoXEtEgHYIJZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX4XvV8JErka0Y
 m6zxPVPe9etkf7qmD4I8vXrlSA9PX6orYtc0FciMXGK22EcbwLe2B6dTMLQr0+oJQtd+92cmWpG
 zf98ghPLPbSRae8QbJj6gzsSCe7n1PDUqS9p7YmVdeljs9Kpu5IhfewoqZKFfarNYB2qBWUPsgv
 ilZONJEPIGKdsUk2HmuogjEDAzEjO5ZABZ9k4w6nCsz46d1rsQjURT/vRTf1tXuMPuWb//qdEKg
 bIMgs3rYS9BCnqnSIJbu+YAibOBDIaolXp1S0Di6gsM3GYvrWxdxxIiUXhDL2mNQA5VEKbR+fhc
 C+3Ug9ITQNr+Atyg1XzUktwfhWdCDXrn7oxToXZWU098X1oKP62bZfxQaBaV32WVROabKm5+Lz9
 yNZfUeo3/nFmM3TobSDlPVqiflOwp2uGmtFMOPhf/8nURkjtxRbCaJT6sb/bUIrHLCgqqbhiXKL
 IsswwP0zRXcxFmp+WQg==
X-Authority-Analysis: v=2.4 cv=XZocX455 c=1 sm=1 tr=0 ts=6af6fe5b cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VS6XN_di3_qKZAQ5k78A:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0OCBTYWx0ZWRfX9OkSeLkTQLpw
 bd589L0LSmO8HyaghGkFxGrv3SRtvwlp5MFjgpgJFrcgpmnXX1Kvjpm8TOWzuGHo9CCNpEa5+2T
 jTQJJNVC4i0vOUwZQQb9+yn1HivYwLE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_04,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 bulkscore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130048

On 11/9/26 6:04 PM, Stanislav Aleksandrov wrote:
> On 09/11/2026 16:12, Konrad Dybcio wrote:
>> On 11/9/26 1:33 AM, Stanislav Aleksandrov wrote:
>>> +&usb_1 {
>>> +	dr_mode = "peripheral";
>>> +	maximum-speed = "high-speed";
>>> +	qcom,select-utmi-as-pipe-clk;
>>
>> Is there no superspeed / dp altmode in hardware?
> 
> The headset supports USB SuperSpeed and DisplayPort via its USB Type-C
> port, I just haven't brought them up yet. It seems we need a new driver
> for the Type-C controller.

OK, we can do that incrememntally

Konrad
