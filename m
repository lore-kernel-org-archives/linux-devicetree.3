Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793075217;
	b=EdJGwpl+wnZpxWbEhl9y8+C101irH11QwB0MR1if4kqMUQRkWJ2o6OasDI9d2HLr106q
	 kABn9MYlNLWeUVuk93vK0TvTetBsDsWWGgn2J6rxDtujp94jhBUqTFHMi3fPpkRtKLZCs
	 ozJivuuPza9R/CqLFsTTqCSUxMRzRLn4HYfeIh9NLD9Eq331udYeOjubGaQfOwEtTu557
	 AzD43iYHbVSgFf0RkqMArtUGD7WtrWTEA+NEUj/y501cqTnWlsXyVZ+/Lr8d6sMNOJW65
	 x1Xo/rr9q/F14s3kqkG54jytO5xYnrEGYeUNNgXTVF+OJjrwyD2KvHfHn0EfPH/uk3Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075217;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=;
	b=FsjvN5vf6oHid2xjzIq6OSJIJ+5xfP+1IQw2Tm7ebaFxG5ZvAlo2Vn95whLixsibrUjN
	 rekMueqeUlJxVLGRCoHY6yHyzTsWLgYnwNh3IxlZdnXrkHherY3x7GaFvf+PnPxVANcsB
	 8O2YZydezGFT8o9vuD80D9k1IHXQJ1r+An+4Rmp6ttgQ6DStDN5MUc5vGC9CVgu0K1AxU
	 L48Jpj/qMgfx/CZAWjfvmsj+Fq/RCldlYaN9QpN5AqCFXIg5fDFtQGjhl2lWYRL6vvw9/
	 HOGMUcDcJZsy7o9fzoGAj1c5nEPEemP5fyzYq6HwmXs9NyIJWS825bH8xBc+PyodyHg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWdUgzXB;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JguEorj1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BE2C606A31E
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:26:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9BE2C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iWdUgzXB;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JguEorj1
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69R2EuYk1348708
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:26:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=; b=iWdUgzXBcnZtNJQ5
	49eWB9KnM2mby/Ra9xncGXEAhRUpjwiKpTbXVN4ctA+nP7FNDaTqVB+Np5I/2CRQ
	WWmtcC6JYZ6lSc1VeGB05ZZFQA4VkLoB4E8ZEbbIUUw+49EJbKMo8+ZB88dOHZap
	m6xyC8m6Q30X7Ped2XD0S4+UChoAp8KswWK7hoPtMOxhghr29dJGOUxW8hcQ4XPO
	KD7LerWeTdCw/0OYr0TUELNPzPhJiNUDBR4QqQkMuHpKSAkgIXyF2HGNlj9TCb7z
	ra+MPyL9MOAnO+uz5QRgmWS0rYMtw+qj/2W30vw0J7el0k1I2ntiZ0vLATHtkOdw
	Q2XysQ==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjjbt8g7n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <devicetree@vger.kernel.org>; Tue, 27 Oct 2026 04:26:50 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5e96da6516bso3919328e0c.1
        for <devicetree@vger.kernel.org>; Mon, 26 Oct 2026 21:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793075210; cv=none;
        d=google.com; s=arc-20260327;
        b=ILtOI07BJnjbnGrAI3NqY4oOAxVkH8QgxEhR3WKZ7LtekCd5XV0ixnaXL/x1XobZg4
         1+KmQfAOByM2AHqCHieTdYfvOiEKUEJIPUjZUMMFqKPfG14saFpHS4Mt4j6nJkaC36EN
         VAlS8wYtaAMNzYan98M1R3SzQMCektBWvOy9tfB/D5mXHGG9YPHV/EPgGmFhQkh1KSQ4
         BExYT8O1bt8HQN0UtVrIrIyQ5G74GtMn1Zm6rLXWkHmCWg34xjERh6n6oOUq0eLJpQSM
         /iP3/qycse4fcxc3In02BdOpGDnq4wsqn0ucXrmNFrsQNljY2s12JtNXu43jyukhyEL7
         HqkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=;
        fh=i02eUjJhfOm4t22HBQ50wsMREmiKoyLFqjVl/QDa5Dw=;
        b=L14E3IRGMyiAQ4roz7gxpN/hj++QSnL+DDZnIo8iAO4SMmanJw+zYYctiD0/Oz0Xy7
         fi1p5PpFjn0lLDRGflmTDmEPiV41I/7mCQ3C0BoMoOQc8lnQHktKtzNaherbVL7vU6KU
         H9Yc4AbTPCUlIEZUTR0qinEFK7pzUkNVORPXYq31sjwf0t7zM1LvWxLkoGDlfC6xyi2H
         VvbJhlGi/8yWlsPciXJahXd7B7twiGoilTSUPEmrYdoJzLB7LdHVbVBsVrbnAaL2Fv3z
         neyxuy/wOOdAXj+t+gU3JFJfZQS+vCmSDT6AvVq/gjni4x/CPexVDl7KZFPjjwDPBblL
         j0Eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793075210; x=1793680010; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=;
        b=JguEorj1DYC0ZHzRjcu+h6eEsL20UXSswiEk/FQVzneSKbaiVmZ606RHkmkMr6HQkh
         xB67AKdZF7NaksJsaGwpF2ynbE7m7sfrtER0yPAhyWwUyJHNnha7wk55m1DaTqIqBLB3
         ewmGD0O01E+6Lk9MiMtIc/x45erEfkogNGM4gMgoEdqfL4taCm2tBv34NuLuNWeDwHma
         hNL41R4a1zG0XMhD4CkinKU238yCx27ff3TFWvLFtfrcrkVwE8f4O8vtQP5AeQXSuCWE
         /fr0j47R1hnVyD0KaIWCVJmPSCR08uxyiIEfgZnprlO9P2KwCsNPH8Am1pOSAD/hP6Yo
         ryBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793075210; x=1793680010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qnmd60cdhtCtvxzhnPhgKIcxLf3UawWMBkYI+AE2XFM=;
        b=qAdruJxr074sSiA5g/FnWRlAO4eBR6PzcbcZeHNDBGmkPskN8YkJiiSfJw2RIACiDu
         qqma3vxQp0mNHhRT+ZhGyv7+3DKHMWtIgwk2eBeA8Zz4Fa8ol+srSMF59ACAqGka6CcH
         nelYiHVAwlPUtsqPylR/jZZClI3Wv1NApe+i+cK4b1J2yLKZalbMaPdDRx16nFyc0C+b
         FAQ6NdOUYWhze0F6OzlOWVi2knPXgq6pq3ykZKb5b86DXnFkVJ0CuDDYTOV0G4bmgcUz
         gmIBPtvgYEL2Wu4gMrX2a0Ky/Smb+gVf4zAWIG2TD1QgLch/pD+pQr11IorOkFaWEX1Y
         E8GA==
X-Forwarded-Encrypted: i=1; AKwUvBw3B/tVK+li57JELtYIc3Y4c+KuC8/Z86qxxJA3JWwz0RBUrl/NXZRP8ncFvV/+CImJ/iMIz6uPx+ma@vger.kernel.org
X-Gm-Message-State: AFq9FYIRJBvGe8XNV5bH792Ia6xtbPfOe/Dz+4vhiFLRaZBO56DNSthK
	L6BBhEPog34z6p3tku8h3XuPQwNrgLdr0CXVZsINdwiQVQGLI7YdoyA3efXheuHShzmQN+E7tm5
	hZO1TBG6Gflhp7Dyr6Oh77VxQY+lZhGczvE++T9y5L+xbCW2tCTTQnA8roPLYJdmAq6JJrqvdBY
	5BMPdLlb10HASThV5O79oKXCHpM0/JTxwyugqh3qU=
X-Gm-Gg: AYBFou2yKu5kNs+HlJ57mdpr45zB9Y68mLp5jkKZ1mY4DEX6gErIRGW/2mNGcfMm1Xv
	18uHlCFTYsZtcvm7t3SYo6IJshoTd61oZEVj13o9OJEEzPZLUAAzhmjCR7W90Xe/xt6kAhpwhyb
	+0ZNTMaJwXWB+F60/pn5cNaPZaS9V7As1u9u1fOUOv422UFlnIRFzxCJAWZJZtkGQHaI/SKKCGz
	b6ceZYweMFYrh6iyA==
X-Received: by 2002:a05:6122:d1c:b0:5ec:a9e:d80f with SMTP id 71dfb90a1353d-5ec2323eb13mr3595409e0c.8.1793075209714;
        Mon, 26 Oct 2026 21:26:49 -0700 (PDT)
X-Received: by 2002:a05:6122:d1c:b0:5ec:a9e:d80f with SMTP id
 71dfb90a1353d-5ec2323eb13mr3595406e0c.8.1793075209303; Mon, 26 Oct 2026
 21:26:49 -0700 (PDT)
X-Mailing-List: devicetree@vger.kernel.org
List-Id: <devicetree.vger.kernel.org>
List-Post: <mailto:devicetree@vger.kernel.org>
List-Help: <mailto:devicetree+help@vger.kernel.org>
List-Subscribe: <mailto:devicetree+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:devicetree+unsubscribe@vger.kernel.org>
List-Owner: <mailto:devicetree+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-11-7da3ea49c8a1@oss.qualcomm.com> <CAFEp6-0b0+daADC6odCCgxgsBYEV6ZJx1eDUNHG=Vi60cA3ZFQ@mail.gmail.com>
In-Reply-To: <CAFEp6-0b0+daADC6odCCgxgsBYEV6ZJx1eDUNHG=Vi60cA3ZFQ@mail.gmail.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 12:26:37 +0800
X-Gm-Features: AclHuK8va6xRV24M9rgTF_POC6JkORw-Ok48zk8PcpaxNQ1oNylaL8QpCWYsZNM
Message-ID: <CACbMrhpYMs6CvAUzJbZDd4+JkpsUSoJaXHcF-A7a0wNoZQDhgQ@mail.gmail.com>
Subject: Re: [PATCH v22 11/14] arm64: dts: qcom: kaanapali: Add CAMSS and
 CSIPHY block definitions
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDAxNyBTYWx0ZWRfXwSunAwfYmobw
 G6G2IcxArvLMIENWb6NnC4PxTTNnO3inxxUm9CcMnv0Dnjf0Eh5AX2AF802/7a3i+GQ/Kjo9aMi
 wODcwRSQ/BfzGm3ypk8h8cCgPVS/Q40=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDAxNyBTYWx0ZWRfXyyIzgIGvkt6T
 hQslER7gIXJH0h96+pSHUsQqlXAvj0v6wQuu8Xpht5WC/RrymEmEarpEFQsMtIqubyQPvyduXmX
 Qvn/o1ZQv0h+Uu4I9LUAszvT6yiRJNPz7l3F78BzWS9XSacH9DLRC3z4pD00BFRSgW8fShUVFBp
 JUvK36KuUGUBvw6KuUNbu/iV+FBP9jvheScA0HREYl5U0Xn0UTRdwh9iF3tMulePNzucnp0ICm7
 sV31iKfa/LDgVrfTVNClJjwUlXHvTXg9c8A0p9N8+IAXZUjmEZAH3WUx33tc3x6VgAlYpj3VMZ0
 lLwWfc5N2SLfiVMjaETwE2tJoCX7dIfNPW7t0jTqzeuYgoBg2GVoW5qPZ6SXYMpOt+tH28GeGF3
 uLcaLue2XBjazKrRGQJc60kEQkb8olwdQ/bTUzqOiRFpHjjqs2H9WdRVDPZxP5T4GlFCY5Cayjl
 loh6x07zlfuEeAXeXhA==
X-Proofpoint-ORIG-GUID: V21jpHCRWSVeFg7F8S4omoANNomtQ98G
X-Proofpoint-GUID: V21jpHCRWSVeFg7F8S4omoANNomtQ98G
X-Authority-Analysis: v=2.4 cv=XaIcX455 c=1 sm=1 tr=0 ts=6ae0280a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=6iLt9ATBiMRDfCnMGdoA:9
 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 spamscore=0 bulkscore=0 priorityscore=1501
 clxscore=1015 lowpriorityscore=0 suspectscore=0 impostorscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610270017

On 10/27/2026 12:29 AM, Loic Poulain wrote:
> On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Describe the CAMSS and CSIPHY blocks on Kaanapali so that camera pipelin=
es
>> can be enabled by board device trees.
>>
[...]
>> +               camss: isp@9253000 {
>> +                       compatible =3D "qcom,kaanapali-camss";
>> +
>> +                       reg =3D <0x0 0x09253000 0x0 0x5e80>,
>> +                             <0x0 0x09263000 0x0 0x5e80>,
>> +                             <0x0 0x09273000 0x0 0x5e80>,
>> +                             <0x0 0x092d3000 0x0 0x3880>,
>> +                             <0x0 0x092e7000 0x0 0x3880>,
>> +                             <0x0 0x093fd000 0x0 0x400>,
>> +                             <0x0 0x093fe000 0x0 0x400>,
>> +                             <0x0 0x093ff000 0x0 0x400>,
>> +                             <0x0 0x09151000 0x0 0x20000>,
>> +                             <0x0 0x09171000 0x0 0x20000>,
>> +                             <0x0 0x09191000 0x0 0x20000>,
>> +                             <0x0 0x092dc000 0x0 0x1300>,
>> +                             <0x0 0x092f0000 0x0 0x1300>;
>> +                       reg-names =3D "csid0",
>> +                                   "csid1",
>> +                                   "csid2",
>> +                                   "csid_lite0",
>> +                                   "csid_lite1",
>> +                                   "csitpg0",
>> +                                   "csitpg1",
>> +                                   "csitpg2",
>> +                                   "vfe0",
>> +                                   "vfe1",
>> +                                   "vfe2",
>> +                                   "vfe_lite0",
>> +                                   "vfe_lite1";
>
> I think we should probably start adding the CAMSS "top" register
> region as well, to provide a more complete description of the CAMSS
> hardware block. This register space contains, among other things, the
> CAMSS hardware version information.
>

Ack. I double-checked and found that Agatti, Shikra, and QCM2290 have
already followed this newly introduced register layout. I'll update both
the binding and DTSI accordingly in the next revision.

---
Best Regards,
Hangxiang
