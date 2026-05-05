Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7F047F2C4
	for <devicetree@vger.kernel.org>; Tue,  5 May 2026 14:27:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777991235; cv=none; b=GsR1TIHs4QnM/lycQM0cEVcl/eDqyz1ccXsF73420lMKvDxi1NCWp0jE1Sr96WVSOEv/rf7h0Gh2meho2DYYicZoCJf4HPE+McFlByeCH2p3m/ProldAfetx7BvS125V8IdKCyCI+HDUbFbIbPmW7WuWVO0YrX1CqU+KNPUXU6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777991235; c=relaxed/simple;
	bh=g+7IKxhiX7ztjndPO88YYZeyrSmovrRfOEc4pWd9eqA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=hljda6us7OSBhOl6/RpmYrjSI3shw/W9XdPkCDhiwRwlbhkbw9u/x0jLwAyR3fCWavOLa3bBldZtelLKK3kGZeQI8zaSAOiFnhZ7hyRPWjxewv6/b7LBSe9LBh4KBU4Uoew0TZzVJjZ5ltMedaeoEFH48DhKAAcBHrNwENt598Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VElEevCX; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IrrgRhKx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VElEevCX";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IrrgRhKx"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 645Do3jP3475758
	for <devicetree@vger.kernel.org>; Tue, 5 May 2026 14:27:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	pySiRqtx4zsZPi7B448XCfGRj+cLU/DeaDKDCajYXho=; b=VElEevCXAp/4eN7D
	j1foutEYx3Vr8neaXKIuICKqkE91uo573myvYqdDi3F5IXBbLooVoYNRod044YSw
	lR5mKzu4rIzdWRx2d/JbjvPxo63qQzGipzt1YBAOZDb5CwgrEeUBk9SQBK7yl7Op
	RnlGVj6RDVf2ezLny5rvOLp51ciXeHa568S8WVA1PeQpTaKKwley3XRb2f4jQskS
	Hmhv3KZWzdQeiQy5aE63//4swak+N6C1OmAAB5qmJA/QhPhJGZUGiWR296GpH8oC
	jGb+vyiCVHK5mJH+jvYSckZJgpYqawQ3A0oPr2XYkR5r+kxenrr5UZyU9vAXrI3h
	JzsaVQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyhsgr4th-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 05 May 2026 14:27:13 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2b81ff82e3cso2908955eec.0
        for <devicetree@vger.kernel.org>; Tue, 05 May 2026 07:27:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777991233; x=1778596033; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pySiRqtx4zsZPi7B448XCfGRj+cLU/DeaDKDCajYXho=;
        b=IrrgRhKxgJnx+fezZ1NeAlnQ6l4RiG2sFifsXMKlGHRf4C6wkOv8va1EnXq327cXkR
         0Nz/0bAcszpvtAoQaME6+f9ccs0W9h77C9SOyWIdiDwdolIIPKs2Rz3MlOtjdEmVHYXQ
         vqhckAwD/GZAUzvWI7Bk/UrDt1ptH2uFyuidpXph8o7A+fvqhcqhw1U/g9s8I8MEgyGQ
         zrwCRQYywin8U59zr2CSzF8o6OdALVBprz59rwhnjtWyfwdA0j59/N9/2jgHH9lS4r6J
         V30395+PH34urCGdOloCSoqrls0f+dqZH5l6RofWK0mSGpz+qrz+uDkg9xEL0y2g7UO0
         NjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777991233; x=1778596033;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pySiRqtx4zsZPi7B448XCfGRj+cLU/DeaDKDCajYXho=;
        b=nMC+ZT8PZR611apcxu3p0d9C5v4PHeC7b3s33FaLk6NPq7NXqRcluApdhdq6uWTjoR
         lRx4aHpREvQMoAMTLbpQeK/KD7oIwbbwMptMQIsESrzpsRLB01KgvH/NeUlWfMw4Qn2K
         duGiOAUlGaNGQkxDJImIfg6fWtGFYdBsXemOqQ/miCbVWO2DokINon84mDXbHmcMAsC4
         GNIL6Hz0Pqr2LBoG8ITAbqfCP/6mZZuRadEufX0MKvgqyTiC6bdIQQcKn2Z5k3qAIfpI
         CUIJt+7EUERKXK/0gsZ9xr6x7NCu76AZ7h3mb7veGJtS6A09gz9nTdhXIkDOPF84cbRC
         HuSw==
X-Forwarded-Encrypted: i=1; AFNElJ+pAyYe8Xuwz+Ek1Qz3ezcJls/IT+EhK5eUlvQiq5tLCN3fb9TdWKVAX5TQ7+tfhbgVsf7YQRKV2RhT@vger.kernel.org
X-Gm-Message-State: AOJu0YwUEDfemisT6HqrpyQqD8ivTod4kfq5/CFHS2kFfeK2umZTnayk
	TigC2UAV2lL8+NkqMKsR3FanDJc9e4gns8d27g6NSBRfs6pBONmBJ375Z9Db/uTEWHlY7y8iART
	kzklDUQF69WPDwMKfHNYal5jNoyOTEQ9tEUn8h7sW7ta0vKdWctVml/GprBlEqQB5
X-Gm-Gg: AeBDievJJRyUQGbvlPGbeQeGlmTBT05DEFpshaayVmRnsaMZf4xlvV7Bo1Z8Zl7UnRw
	jGIZGYr2HzH9+t4StceNUk5dcwe0Wtbo4RD3UIvqj4l3uLK8Y2vger1j0FZbxCNfkVSCaI3acob
	eFuuf/D37/Ka0eLHKTquP/YJ4kvEgAEt8F2u/WOcyJ8MdInybWkCFxz2rqTazMQbDtWjgelH0vT
	NOVEk/fjCK8dfEsZWf5YPiGkjYu5qMqDfJfW9SzsjZ1HtwehbYN6PTnh7rXFopLFlmVMZ/lWeXO
	WO90ZYVASBAw60ac24QJ2gl++NUSNtvC7+B3pYgbmQWeDbvRmDhjigYsSpNXqKZMFlYsmoyz8Ab
	s6Dy4+2sbDyjHBwXhvBNYbkvHwJKRP4wAb/9H6B4d16G7bATVMTHJDPakwAiiTq/QmRMS1d2ZoI
	KFAZLh+DJgae2UNklP
X-Received: by 2002:a05:701b:2507:b0:12d:de3e:86b2 with SMTP id a92af1059eb24-130a9ffb6e3mr1020240c88.21.1777991233101;
        Tue, 05 May 2026 07:27:13 -0700 (PDT)
X-Received: by 2002:a05:701b:2507:b0:12d:de3e:86b2 with SMTP id a92af1059eb24-130a9ffb6e3mr1020185c88.21.1777991232530;
        Tue, 05 May 2026 07:27:12 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84252c0sm23637548c88.10.2026.05.05.07.27.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2026 07:27:11 -0700 (PDT)
Message-ID: <3bfdc11c-115f-45ab-b0ab-75ad88dc6f31@oss.qualcomm.com>
Date: Tue, 5 May 2026 07:27:09 -0700
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 14/16] wifi: ath12k: Switch to generic PAS TZ APIs
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org,
        konradybcio@kernel.org
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-media@vger.kernel.org, netdev@vger.kernel.org,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-remoteproc@vger.kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        dikshita.agarwal@oss.qualcomm.com, bod@kernel.org, mchehab@kernel.org,
        elder@kernel.org, andrew+netdev@lunn.ch, davem@davemloft.net,
        edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
        jjohnson@kernel.org, mathieu.poirier@linaro.org,
        trilokkumar.soni@oss.qualcomm.com, mukesh.ojha@oss.qualcomm.com,
        pavan.kondeti@oss.qualcomm.com, jorge.ramirez@oss.qualcomm.com,
        tonyh@qti.qualcomm.com, vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>
References: <20260504130603.1474043-1-sumit.garg@kernel.org>
 <20260504130603.1474043-15-sumit.garg@kernel.org>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260504130603.1474043-15-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: SwaAqcD1lpauZ6lydysvssE4qYR3nrCi
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA1MDEzOCBTYWx0ZWRfX4XRHM2PWHGBw
 uL/gDcNrnYZt418NfwI5QWVTTWKA9WyaRapeM1duz4UK7fCTCj7Wxw2G9PigObzpccMKGnJ+ATX
 pIY2bC0IMMednkfx6qk+Ag3UYx+U4/G8NW2Q06iTxvcwwutj+pRjWX2nfTm0cjNQ8b9++0FqcJ9
 3e9JGtAGMkwYIOwiGYS+0FWc2q9e9W2e6GI5HMICL14ZtUofvMk2bqpbT7OM2ovisXoS5Nnextl
 QQMd8alkzKeVhARM565TYsISYzv+rcMKiNVq8+Ae6WTqJf+KrEGoWqMpa/cMW8EIZ5KWA+moCFN
 +M6Oxn159Vl9BCBLSO5OAVoudXR15SI3YQzIcRcKa8ogVTGunr0b4vYc0weaXDwaJiSfT7y2Nyg
 AWLPnan0VaDpP/YpN71DHFJUxMSj4i7VkWbMeabsQHcOCa7Xh0gm/BVEdWy2zElXihxqHSTwC8h
 by6IV2/2yU7Hn/bXcGQ==
X-Authority-Analysis: v=2.4 cv=EPU2FVZC c=1 sm=1 tr=0 ts=69f9fe41 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=_vM1m9lfSBLZ1nnPSXUA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: SwaAqcD1lpauZ6lydysvssE4qYR3nrCi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_02,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605050138

On 5/4/2026 6:06 AM, Sumit Garg wrote:
> @@ -485,9 +485,9 @@ static void ath12k_ahb_power_down(struct ath12k_base *ab, bool is_suspend)
>  		pasid = (u32_encode_bits(ab_ahb->userpd_id, ATH12K_USERPD_ID_MASK)) |
>  			 ATH12K_AHB_UPD_SWID;
>  		/* Release the firmware */
> -		ret = qcom_scm_pas_shutdown(pasid);
> +		ret = qcom_pas_shutdown(pasid);
>  		if (ret)
> -			ath12k_err(ab, "scm pas shutdown failed for userPD%d\n",
> +			ath12k_err(ab, "pas shutdown failed for userPD%d: %d\n",
>  				   ab_ahb->userpd_id);

at some point the "ret" param was dropped, and this now generates build warnings

>  	}
>  }

