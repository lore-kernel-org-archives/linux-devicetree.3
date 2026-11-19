Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795095261;
	b=tG59ddR6cRtEKv7S0B3S0nxK3sO8ku6E38UophqBuugCLfLvJJkBR0kZzeoJzGUg8xpf
	 +mzkGH80FFuejQiP6hAIROSeHVagPvNCGQXHQwlPPjY2+6IU0eyjbXX0jobcj1Vf85EFc
	 g24edbeUiWhlyrD/mhfZJEXmfiJ9DSZ+2ee2GQbufHIZj5Cb/DSZT6UP+zGIATM9fpbo+
	 Tc3tjGd9ju/yq79vXFZAO08wFvARmIDLB5pjFu4HQ5KY/zGL5gyLFX2MVfG/kfYH0mR0E
	 aYsR9XA/C6T4SpqtXj8F2E8YeMErHjKDWFGIWpMrE4XfsgTZLslwmztoyQls76mzzag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795095261;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=XdEYrnYr49EMd463s6DrTHK2N5Yf7ZI2aLUZaA14Nm8=;
	b=S+4CClM8Lt0Ngbs/ZGF8TANRwbMVX4+CVV3ZuNX/NY5Dik21b15SRXnaUT2yRZCTWZyn
	 GLyHxlSmze3recIVe7w5m6qxENevZAbWXK8Uj2jmntfv0n9E3ouJ2M7cUOIt82C+ubg3Z
	 AgCnZQAZkWoxsVAkMkU1CZUpF6VXXy3989V9Gusw5wVDmuL0EOha2LpcuKdvFPW15XIfs
	 Rm2jGZ5eZSp9sRRhbByyhQXXJq7/+pf+VRtB6BswSVKdrmZYY8IKEBEBpR0SMBPmr5kQX
	 p+gbRJDGWZ/5ES2m/S9mcakjivdiAuQvUT0r7eqaUkjUSNiY78SXZlQtBpft/VEv0rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=im7pBgOR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y1FXb2f2;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2773660A2607
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 13:34:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2773660A2607
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=im7pBgOR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Y1FXb2f2
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJBjwvg3319817
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 13:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XdEYrnYr49EMd463s6DrTHK2N5Yf7ZI2aLUZaA14Nm8=; b=im7pBgORjzoPB17n
	j5y184hEUdw1JoyjvY1hXb7jvS62rbF3Og4cl0O9fz/EjjiYrH2GVj0NtesGegRZ
	bQVx+NbIU+oeb3PhNagba2foACMHlZM9YgNB/SL0Y9xvOPqPBFZnQOzQ0Zbza1uv
	o5ADCGCM/GXFU6QWcJlVHLE1plAjZUS0TCqjCv7YGv9wS93fjRY6z4AenarCi+Zz
	GzERrUKeZAPDfT5p9Qf4CQ3PD0N2CzIPVJkyAiuZSk6ogTUHhpB9nWTJTO5GFWaE
	nH9Ktt1SdhcBC2C+xuKe3Xstv894tt6cTsGU7fpUOwHpX9qVF/b0vjM4W0VnNlU6
	Yxu9Cw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1xx18t5m-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 13:34:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b3fd219d07so723912a91.3
        for <devicetree@vger.kernel.org>; Thu, 19 Nov 2026 05:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795095259; x=1795700059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XdEYrnYr49EMd463s6DrTHK2N5Yf7ZI2aLUZaA14Nm8=;
        b=Y1FXb2f2A6ldofU4SC5eGHthfBy736SjED/xRPvsiBHRZbdRFUEb+ahrOF0yENnnPK
         LjCLQbw8lyg0lpQMtZTYKu119J87hD4t8I1L3kNjGB65Nb4GQYCHyS49aamNWhtmvSyt
         zPzCMzPuou+IbJ3MP3isbfOhS3+ehTssiol7hlTcidOUmaBNsFAFcIrOK5ivDouqMDvY
         a4kFTMiqz71VWUQyTk/7L3Hfkc7RbwZby63ZkoZxL2VLdC4cRws0dg9UoefPgHN96CEf
         35GCozYul3qU0YVqQCeUgvRVp7B+n1KGPmH/ciips33NReQ3MGYVI0GAoLFC8QFLFZZp
         K8fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795095259; x=1795700059;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XdEYrnYr49EMd463s6DrTHK2N5Yf7ZI2aLUZaA14Nm8=;
        b=hiNyWGbkOifh0+fpiqEkz4uO/v74FwcLM41psP3lu8xoaxDUPXALEmAj8I+LePQo12
         hm6Dge/RGzhZFxe+iYKpB28VupZ/VR9DpVcTEPS74JOwy7QODRgWKscPM9B19/sJNH/8
         MtDseiO3O5VaBT6u136B0u6BEJT0qbbScFYY5YzELiTzrt9Xe/28vpBRvKW8WKDGGD5s
         FyrvXW1KsoFQcsPrZEA003swO4smInRqGheIfdQ/xpYuE7C93w20dY/7mAP5lz6SpDWQ
         IJggXQh+9JsLNNudXYxT8VtPORhJeoRBdwWc/sXdX5C0wGZFHvJMYVDeOM868WEPdWBJ
         9UoA==
X-Forwarded-Encrypted: i=1; AL+hErE7p1pLjBhNldm/HPyAsuC9zx/yVRujC5zSOE3l2/QJaU2qNzsMIv9Y8LKAmETExZ+6nJpYWU/YgenB@vger.kernel.org
X-Gm-Message-State: APuU4Z/CrUJ3ij7mLSFVe/IHfeOVNm7HRQwYcB/ZJS5GnyaMre9yblFw
	Z1sMcTPoXwF911vMS3pCuSE6IkMVkigT3FQYKGhWHVHXR2t8/6yx6ythR4YdrumVUn5Sxol+mDM
	33o5Nb5u3FPfkLCktaMSc+y+djJWjFPkZ4Rxx4tlixZFdH/60Wyic1So58PAo5bdq
X-Gm-Gg: AZFdTZeNTDwPOBNuTzTW79MrFgHA4FpDsPWjfpGvFtWNxYZ4rYX2Qg4Ry6IDSB0Mk2M
	viVlG8tM0CCMcp2BfcE/5554115ZSRIiZJtyidqIQFF0iT7dOwxL9Xb1WVwwwv6WXU7qG8uqhsh
	v6XaSKbTEOFkSFtdwd3fqRkZ2pr1PnDsM4cRX+prOOD+j10gbp6S4so9ILaMzeZ0diLeVhqY9yh
	66QcIvgvRsDt2f3X/jGnSycmDo7TRpwkLSkI0TJlkrIQXkZhJVAQ7Ljt1diN46qa36KglTHuXRq
	5ktegbnKCIyBCyCpnpI9e8pHxbD6087xOFETsKHRqyX5L/z5QwzeUNOTG5ydBChE9pv7RfNJZ3w
	aVWYvANbCZM4yyvoH1mkUeU1m4pPzh5kUTERv3EE0hQbqj5anscLSzuGnhoLpQElTT3b3A1T3JO
	xCyw==
X-Received: by 2002:a17:90b:2d86:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b3d0828c40mr5184626a91.52.1795095258596;
        Thu, 19 Nov 2026 05:34:18 -0800 (PST)
X-Received: by 2002:a17:90b:2d86:b0:3ac:6e91:3f22 with SMTP id 98e67ed59e1d1-3b3d0828c40mr5184602a91.52.1795095258052;
        Thu, 19 Nov 2026 05:34:18 -0800 (PST)
Received: from [10.206.111.19] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b401f75ee4sm1493331a91.0.2026.11.19.05.34.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 05:34:17 -0800 (PST)
Message-ID: <18effb9d-b83a-4842-a32c-0f2305cf0a14@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 19:04:11 +0530
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
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
 <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
 <20261116-vegan-amphibian-muskox-3c8a55@quoll>
 <de0bd55f-9b80-414f-adb6-eece067d92ff@oss.qualcomm.com>
 <8e8300f1-d837-495b-b947-a3b52f44b4d6@kernel.org>
 <d90f6dc5-bd8b-4fa3-a17a-e00470a9b8a8@oss.qualcomm.com>
 <88467521-f50d-4c87-8206-4a3249f65212@oss.qualcomm.com>
 <d741093d-345d-4cdf-a48d-2c5e55be2129@kernel.org>
Content-Language: en-US
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
In-Reply-To: <d741093d-345d-4cdf-a48d-2c5e55be2129@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=PcBqFShd c=1 sm=1 tr=0 ts=6afefadb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=KOBisHcl_ayXGa7m1pEA:9 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 3TVhhETARvLL6lFePWZRv_pn4WqBYkKM
X-Proofpoint-GUID: 3TVhhETARvLL6lFePWZRv_pn4WqBYkKM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDA1MyBTYWx0ZWRfX/RePvndAQDHD
 Zup91edZE4bW8lMLEQcLzZJDmxzKgIjZK8+r2d3OLWHeiSM3FZWd6TDW34zokmztgfP5//woZmE
 vtqALVPztanl3D06xVtznoBg9Wt1ebglkln/Sw4abkhFVHZsR82Rq305cxVZ6S/OKK/GzkZDOBo
 kMXw6EtXeGtcusxx+tpPgrMDi4aJ/W+WUc1Ni/KnrKkdJJDodMig6T5SgwmQE9jJy83d++iJ9Ut
 ZOejCtvoi/kTN9SRE4NtbtJgxouP0B33pVg4czG3Zf8NBy5G+oNS95HQdpDrmnvbt/UBEIyAyPU
 sVEqdTLsFLxkhyZVR5x5V9EILEDKtnJ5Xznqn6wVNcExrvZBlJY1MmPL4cAM1eK6bDu53ev73dt
 9ap5yxO6sBRhog4uWhW7OAZOH9cxvyN507Oes2o7mx1MoGZqwoIUPS5jm9usYOTHu6xBbxa0W5A
 kAwzuGyMuKjIygZ/Iug==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDA1MyBTYWx0ZWRfX6PLsyXbpHJX5
 Q6lf+TTAkcXYNyQdlPTLnWKbI3H+Yi51jFCSEmujLu8yxbeioffBTBmyR7LFi1nHuTH6iOQo3Cd
 p6bufKBOUzsv9GWp8MIzEriKyGDTeXk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_03,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 bulkscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190053



On 19-11-2026 17:36, Krzysztof Kozlowski wrote:
>> How would you prefer this ABI issue to be handled, or should I
>> send the next version incorporating Loic's comments?
> Commit msg should be clear that ABI is changed, whether that ABI was
> ever working or even correct/possible to work in the first place. You do
> not answer my question really, because if description was not correct
> but everything was working fine, then clearly IT WAS correct to some level.

Yes, you are right. The old ABI was functional with the driver data at that
time, even though it used the X1E80100 CSIPHY resource index instead of a
Glymur-specific port mapping.

Old mapping:
  port@0 -> X1E80100 csiphy_res[0] -> CSIPHY0
  port@1 -> X1E80100 csiphy_res[1] -> CSIPHY1
  port@2 -> X1E80100 csiphy_res[2] -> CSIPHY2, not present on Glymur
  port@3 -> X1E80100 csiphy_res[3] -> CSIPHY4

So port@3 was functional before.

Now, Glymur is using linear graph ports instead of reusing X1E80100:
  port@0 -> csiphy_res[0] -> CSIPHY0
  port@1 -> csiphy_res[1] -> CSIPHY1
  port@2 -> csiphy_res[2] -> CSIPHY4

I will make this ABI change clear in the commit message.
-- 
Regards,
Nihal Kumar Gupta

