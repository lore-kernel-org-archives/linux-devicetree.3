Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 971353EDE53
	for <devicetree@vger.kernel.org>; Tue,  7 Jul 2026 20:41:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783456909; cv=none; b=ejoQuqhabXmWmWbznXx5XwEAuvBkiy26BREz05n5QeivAlb5XNujdn1c0/75eUM/v57rLpDhRQmJa3WPxDigoT+9yJctO+y808ngcQIpMo39XITikX2FxC5+p7dwl04dAT+/r4XYBy3X5H131ylt9hWcvgLhYK6lWr6erhezOW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783456909; c=relaxed/simple;
	bh=oat1GvbIX3mIF4dAriHPdkOESs774O5N7WYidfkBbd8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EZoM5TO1SLIkBBCpcrq5JI5yuuwOZ7JpJ2qiix8TQIbo9CdYbVKuS7U2SXdSCnczGSMvwgWnsUT2Fx5rMmU7WtgFI3DLphmtPZnhG/Jou3C/hZBzR8tutIqlG4MPy1VIMQbMVYuPG06luSFhK6LQX9nAXmvPMoLtE5sNsl0Xsoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GGmh/Uhm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gCzYcJHi; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGmh/Uhm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gCzYcJHi"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 667Jerwv371584
	for <devicetree@vger.kernel.org>; Tue, 7 Jul 2026 20:41:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gCvkekoa4er4Tteeuol06EdVNkgFR18slO6Bu6KspqA=; b=GGmh/Uhm4xBaURoq
	hLEToFJLBw4he5yg2ex+RY23ERdEdBaOnI1ygr4Ic5BdZgS52J9MZ1wLLFt+awO8
	pXS2HxQeVrlVG8FG54ved26jVsyyu3IAJ6D0tKVuDOTCtiuIMkO7YsJkkJICxtwq
	uqaR0w5aJuc++hRa+B9ZofQZJviKIPiW38CGO8WxWgjhpjTbq4kCf54fKgz6St/i
	ZqD3iSG33tk+mc3ghjahHwFu87H1ho3o6vwm74G1ME8IY3yUYlvSpzGliocKaQwX
	wLk/7M/0TCwT8t4W9Mj31Mc2BeH0vC2KvFaknsk1fwtxEuBbz8+B+RAm0DDgJRM9
	X3nrVQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f97u105sw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 20:41:47 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c20762d21so56971621cf.0
        for <devicetree@vger.kernel.org>; Tue, 07 Jul 2026 13:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783456907; x=1784061707; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gCvkekoa4er4Tteeuol06EdVNkgFR18slO6Bu6KspqA=;
        b=gCzYcJHiNb2c8Zs1+UbnxcBh2hGa8vdB7/MZ/B9ufjNLEmgRyCBGrLRmSsyK71pLwi
         MVG40p0/oZDUhzkBQ5El/uJMwfB/NNlW5AiZmn5xaLnCvVO0Spxrt4DlGUC0ERJO1MQ6
         r1wWp3Fwv34ZnYTSuRvP99ozadrzcQdT3OHyGfsGLqkA1GkU29WMF3cEqscZ0gKlbWqN
         +e3T3p+9T2fTdsCS9O1y4Pbsj3voFmxsIqwRcwPCjgf1Y5ln5i80I3FjosyODNdMSdMp
         NkLCBEO9xX4Z3Wy3IfnqAArsFZvKwaf+RK+MBPnBjIbB6/O03K2cjw4Fqp4GvSuRvG8K
         CK1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783456907; x=1784061707;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gCvkekoa4er4Tteeuol06EdVNkgFR18slO6Bu6KspqA=;
        b=aeHYQ6D3ETW/llK+HfGvobkP03kdGXs+hCLKzGUQxTAcKP/HF7oyCco5JMaFmbGaoo
         GnapHhFwfSvrjl5Iem33iv5XMYZvFosWZ5zpKXJGhg+vuYERE9dfwbBiEpjmZmogyDGk
         ZmioECIPbDM4+zGAoPGBMTGg2CUpzz1oxHPjE8Vk8xP2KT15a4onoGX3gf5mPPWbtOmM
         CUB9KWezHZmRt3sKqdceuXytIokBXdUkjKBuZ0fi5+bgu2EhslhJ1MEwZyZ2lfzpnk0w
         7pL54sb/qvheno2L63UlLDoX1CN7H1ApKx1SJgoyp5NgbL9LSPt2FJ5TJ+9Wn8g1rCRU
         ZDvg==
X-Forwarded-Encrypted: i=1; AHgh+Rq1GPchTFYnNYyIWRkPA6hV1msXoVPPhgKYKerFA5IK4mQk+25IgnJL5Ihi+88rlK6MNK+6OoUrlZX6@vger.kernel.org
X-Gm-Message-State: AOJu0YzGY+jVgHOA5N1zac3tf/X4xBezt8eZgdXpBPYZg39bTvBB5U2G
	Ph/VB0Xb8HMz0I6zjejQjEz3NcuaZflN/zhfxWooNTlDX0V96pPFXbXJYV9iq2J2JerMYKEhRIx
	zeHlQBzdgJPqzFvVK32w53GiFaR8ewEZmna9iy23By5My+6JzhSfyrL5UEko6h0pj
X-Gm-Gg: AfdE7clot74AJRwHfynsErYMUCY8VtFP2wtFCE5T1ixUkocMAYwhYjhOhOP/eQbWRwL
	3dfemg28gtQ2rvJhPjeloOEXzVfn+NuHtZLr/RVMz+Mih2CocLmOcBLWt4VEWu5V4seaN8cFLWH
	8tgCpJ3b6IWw1o2dsc/titH21zT0jMhwVADxwTs0efs2c6+Epl7cO87r38y5jrJzxpfA3McHViy
	n8rYZ8CuDlHVuu8uaiLRJ9HWJEkSylBW/ekmTGWkg4o9+LGsjrlJFoX/H3MqTqky7wCbcin5owT
	4aTII0NHJn+T7T10Dn+ikj4pUiZURlZbTL6IVUHqp+IUcMKcLeO6fnBUuKKyJsVTleZ5PG/S0cg
	BHolD+Zq+nzrywzSXbU3emeUmgrfo6Ii3+V8j5g==
X-Received: by 2002:ac8:690e:0:b0:517:6d82:9aec with SMTP id d75a77b69052e-51c74676b89mr74825001cf.0.1783456906851;
        Tue, 07 Jul 2026 13:41:46 -0700 (PDT)
X-Received: by 2002:ac8:690e:0:b0:517:6d82:9aec with SMTP id d75a77b69052e-51c74676b89mr74824661cf.0.1783456906256;
        Tue, 07 Jul 2026 13:41:46 -0700 (PDT)
Received: from [192.168.68.120] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-47aa039ad21sm36001629f8f.20.2026.07.07.13.41.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Jul 2026 13:41:45 -0700 (PDT)
Message-ID: <64af4615-4581-43dd-a1b1-8324c63d5853@oss.qualcomm.com>
Date: Tue, 7 Jul 2026 21:41:43 +0100
Precedence: bulk
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: qcom: monaco-arduino-monza: Add overlay
 for Waveshare WM8960 Audio HAT
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        loic.poulain@oss.qualcomm.com
References: <20260707163703.233405-1-srinivas.kandagatla@oss.qualcomm.com>
 <20260707163703.233405-4-srinivas.kandagatla@oss.qualcomm.com>
 <zfmtqi3k3miv3ncgla5x3gjktj5j25zkyqqxmyq5i44ynzfnhb@7mruev4sw5vm>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <zfmtqi3k3miv3ncgla5x3gjktj5j25zkyqqxmyq5i44ynzfnhb@7mruev4sw5vm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: xdIOHoCQbvxOO4hovmM4VEvBd-JBhZde
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA3MDIwMSBTYWx0ZWRfXwmfq0Jb280qW
 mDGJZSmhSnukXHQQCZNqVAsv9KGc4CQ2R7mtdjyiPE+IU5unbWYnZrrxkRaGMO7HPmDWj8agAI/
 FA58tasSqzI2cJRPN2OXgBsRTdZg8hc=
X-Authority-Analysis: v=2.4 cv=F9JnsKhN c=1 sm=1 tr=0 ts=6a4d648b cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=dzfq2vkET6RgKwHabl4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: xdIOHoCQbvxOO4hovmM4VEvBd-JBhZde
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA3MDIwMSBTYWx0ZWRfX8EdOMpr9mjlr
 Ucv8H3qNoOt6Pls2D5l9WE+IA0+Vtmpp/i7By6cxdvpPmacnOBVb0xaVG3rzdimu7aYrbmoLyVV
 MdwLJOjoat8n8hQThIB0DkImKfFHDu5H1j7K3GsyTgQm4Pr6uNPtjtwHLdD9D6l8ItDFdvATR/r
 +AH32w2ziX3SXXsiLfMHY9jGUht5XVuHOjeC4ZUaZxfl90b2AR/rRiDZnirXO0443hK4HiFZZYa
 FfJofZk8kjADoSVOjB9y0ZwkegzRn2lNXrrInjjZkJ2bUILN0dOYr8+3ho5T7vITd2/7DNx2N7J
 sTNhBJNJxspcXw3dDoCBE8zw79FjRLOAUgEmNJnOWvz0bMwg/eWg5zAk+69hnUDMwM6f8PwXOr5
 8XCjj152ZXooGys4HJ3lHn5X9D3ajgwj168a/oRNO83JqES1lovLswUgEk+W0SvYeIUdH3Oaknh
 bcHOxOLuJrzbC5xJAwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-07_05,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607070201

On 7/7/26 7:15 PM, Dmitry Baryshkov wrote:
> On Tue, Jul 07, 2026 at 05:37:03PM +0100, Srinivas Kandagatla wrote:
>> Add a DT overlay for the Waveshare WM8960 Audio HAT connected to the
>> 40-pin JHAT connector. The overlay adds the WM8960 fixed MCLK clock,
>> the WM8960 codec on I2C0, and the corresponding I2S1 playback and
>> capture DAI links to the sound card.
> 
> The contents of the overlay is more or less visible from the patch.
> Please provide some useful documentation, e.g. how to test the codec.
> Does one need extra UCM file for it? 

Yes, currently this has been tested manually with mixer commands from
console, the plan make this work with ucm dynamically based on the
existence of the dai-link that comes as part of overlay.

Here is wip ucm changes required for this,

https://github.com/Srinivas-Kandagatla/alsa-ucm-conf/tree/ventuno-q-jhat

--srini
> 
>>
>> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
>> ---
>>  arch/arm64/boot/dts/qcom/Makefile             |   4 +
>>  ...uino-monza-waveshare-wm8960-audio-hat.dtso | 100 ++++++++++++++++++
>>  2 files changed, 104 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/qcom/monaco-arduino-monza-waveshare-wm8960-audio-hat.dtso
> 
> 

